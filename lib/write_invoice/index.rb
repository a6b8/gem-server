require 'net/http'
require 'sinatra/base'
require 'sinatra/multi_route'
require 'base64'

require 'write_invoice'

require 'active_support/core_ext/hash/indifferent_access'
require 'pp'


require './lib/write_invoice/routes/payload'
require './lib/write_invoice/routes/document'

require './lib/write_invoice/helpers/helpers.rb'
require './lib/write_invoice/helpers/env'

require './lib/write_invoice/struct/blocks.rb'

Env.environment( 'XYZ_' )
Env.secrets( 'XYZ_' )


class Invoice < Sinatra::Base
    register Sinatra::MultiRoute
    extend Helpers
    extend Payload
    extend Env


    def initialize()
        super()

        @logo = Helper.logo( @config[:logo] )
        @config = {
            logo: 'https://docs.writeinvoice.com/assets/images/logo-demo.png',
            plans: {
                preview: {
                    articles_total: 5,
                    invoices_total: 1,
                    checks: {
                        show__logo: true,
                        headline__image__src: @logo,
                        show__unencrypted: false,
                        show__watermark: true,
                        text__watermark: 'Example',
                        style__watermark__font_size: 180
                    }
                },
                basic: {
                    articles_total: 20,
                    invoices_total: 10,
                    checks: {
                        show__logo: true,
                        headline__image__src: @logo,
                        show__unencrypted: false,
                        show__watermark: true,
                        text__watermark: 'Example',
                        style__watermark__font_size: 180
                    }
                },
                pro: {
                    articles_total: 100,
                    invoices_total: 100,
                    checks: {
                        show__logo: true,
                        headline__image__src: @logo,
                        show__unencrypted: false,
                        show__watermark: true,
                        text__watermark: 'Example',
                        style__watermark__font_size: 180
                    } 
                }
            }
        }

        @examples = Helpers.example()
        @index = 0

        case ENV[ 'XYZ_ENVIRONMENT']
        when 'production'
            puts "DETECT: production"
            set :bind, '0.0.0.0'
            set :port, '80'
        when 'development'
            puts "DETECT: development"
        end

        str = ENV['XYZ_RAPIDAPI_HEADER']
        @header = 'HTTP_'.concat( str.upcase.gsub!( '-', '_' ) )
        puts @header
    end


    # use Rack::Auth::Basic, "Restricted Area" do | username, password |
    #     username == ENV['XYZ_AUTH_USER'] and password == ENV['XYZ_AUTH_PASSWORD']
    # end


    get '/payload/preview', '/payload/basic', '/payload/pro' do
        content_type 'text/plain'
        service_type = request.path_info.split( '/' ).last.to_sym

        mode, messages, item = Payload.validation( params, @config[:plans][ service_type ] )
        messages = Env.rapidapi( messages, 'XYZ_', request.env[ @header ] )

        if messages.empty?
            struct, messages = Payload.generate( mode, messages, item, @examples[ @index ] )
        end

        if messages.empty?
            @index == @examples.length - 1 ? @index = 0 : @index = @index + 1
            return struct
        else
            response.status = 404
            return Helpers.messages( messages )
        end
    end

      
    post '/document/preview', '/document/basic', '/document/pro' do
        service_type = request.path_info.split( '/' ).last.to_sym
        messages, hash = Document.validation( request.body.read, @config[:plans][ service_type ] )
        messages = Env.rapidapi( messages, 'XYZ_', request.env[ @header ] )

        if messages.empty?
            begin
                doc = WriteInvoice::Document.generate( 
                    payload: hash[:payload], 
                    options: hash[:options], 
                    debug: false 
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

        if messages.empty?
            return doc
        else
            response.status = 404
            return Helpers.messages( messages )
        end
    end
end


