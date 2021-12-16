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
        alphabet = ( 'a'..'z' ).to_a
        @examples = Blocks.options
            .select { | k, v | v[:examples].length > 0 }
            .map { | k, v | v[:examples].map.with_index { | a, i |
                a[:options][:show__unencrypted] = false
                a[:url] = "https://docs.writeinvoice.com/options/#{k}"
                a[:description] = "#{a[:description]} | This Example is randomly choosen, for more Information visit: #{a[:url]}#example-#{alphabet[ i ]}"
                a
            } }
            .reject { | k, v | v.nil? }
            .reject { | k, v | !v[:description].index( 'font' ).nil? }
            .reject { | k, v | !v[:description].index( 'logo' ).nil? }
            .flatten
            .shuffle

        puts "Examples: #{ @examples.length}"
        @index = 0
        @debug = false
    end


    get '/payload' do
        content_type 'text/plain'
        validation, mode, messages = Helpers.payload_validation( params )

        if validation
            payload = WriteInvoice::Example.generate( invoices_total: 2..2, debug: @debug )
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
        end

        if messages.length == 0 
            return struct
        else
            return Helpers.error_output( messages )
        end
    end
      
      
    post '/document' do
        str = request.body.read
        validation, mode, messages, hash = Helpers.document_validation( str )

        if validation
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
        else
            return Helpers.error_output( messages )
        end
    end
end