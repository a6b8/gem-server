require 'net/http'
require 'sinatra/base'
require 'write_invoice'

require 'active_support/core_ext/hash/indifferent_access'
require 'pp'

require './lib/write_invoice/blocks.rb'
require './lib/write_invoice/helpers.rb'


class Invoice < Sinatra::Base
    extend Helpers

    def initialize
        super()
        @examples = Helpers.example_prepare()
        @index = 0
        @debug = false
    end


    get '/payload' do
        content_type 'text/plain'
        mode, messages, item = Helpers.payload_validation( params )

        if messages.length == 0
            puts "Result: #{item}"
            payload = WriteInvoice::Example.generate( 
                articles_total: item[:articles_total],
                invoices_total: item[:invoices_total],
                debug: @debug )

            example = @examples[ @index ]

            struct = {
                type: mode,
                description: example[:description],
                payload: payload,
                options: nil
            }
            
            case struct[:type]
            when 'payload:hash/options:hash'
                struct[:options] = example[:options]
                struct = struct.pretty_inspect
                @index == @examples.length - 1 ? @index = 0 : @index = @index + 1
            when 'payload:json/options:hash'
                struct[:options] = example[:options].to_s
                struct = JSON.pretty_generate( struct )
                @index == @examples.length - 1 ? @index = 0 : @index = @index + 1
            else
                messages.push( '- Something went wrong!' )
            end

            return struct
        else
            return Helpers.error_output( messages )
        end
    end
      
      
    post '/document' do
        str = request.body.read
        messages, hash = Helpers.document_validation( str )
        if messages.length == 0
            messages = Helpers.document_freeium( hash, messages )
            if messages.length == 0
                begin
                    doc = WriteInvoice::Document
                        .generate( payload: hash[:payload], options: hash[:options], debug: @debug )
                    if !doc.class.eql? Array
                        return doc
                    else
                        m = doc.map { | a | "- #{a}"}
                        messages.concat( m )
                        return Helpers.error_output( messages )
                    end
                rescue
                    messages.push( '- Generating of document failed, internal error.' )
                    return Helpers.error_output( messages )
                end
                return Helpers.error_output( messages )
            end
            return Helpers.error_output( messages )
        end
    end
end