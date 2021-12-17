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

        str = 'X-RapidAPI-Proxy-Secret'

        if ENV.keys.include?( 'HTTP_X_RAPIDAPI_PROXY_SECRET' )
            @proxy_secret = ENV[ 'HTTP_X_RAPIDAPI_PROXY_SECRET' ]
        else
            @proxy_secret = File
                .read( './.env' )
                .split( "\n" )
                .map { | n | n.split( /=(.+)/ ) }
                .to_h
                .with_indifferent_access[ str ]
        end

        @header = 'HTTP_'.concat(  str .upcase.gsub!( '-', '_' ) )
    end


    get '/payload' do
        content_type 'text/plain'
        mode, messages, item = Helpers.payload_validation( params )
        messages = Helpers.secret_validation( messages, request.env[@header], @proxy_secret )

        if messages.length == 0
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
            response.status = 404
            return Helpers.error_output( messages )
        end
    end
      
      
    post '/document' do
        str = request.body.read
        messages, hash = Helpers.document_validation( str )
        messages = Helpers.secret_validation( messages, request.env[@header], @proxy_secret )

        if messages.length == 0
            messages = Helpers.document_freeium( hash, messages )
            if messages.length == 0
                begin
                    doc = WriteInvoice::Document.generate( 
                        payload: hash[:payload], 
                        options: hash[:options], 
                        debug: @debug 
                    )

                    if !doc.class.eql? Array
                        return doc
                    else
                        ms = doc.map { | a | "- #{a}" }
                        messages.concat( ms )
                    end
                rescue
                    messages.push( '- Processing of document failed, internal error.' )
                end
            end
        end

        if messages.length == 0
            return doc
        else
            response.status = 404
            return Helpers.error_output( messages )
        end
    end
end