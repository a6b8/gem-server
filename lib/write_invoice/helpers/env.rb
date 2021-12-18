module Env
    def self.environment( prefix ) 
        hash = {
            detect: 'XYZ_RAPIDAPI_SECRET',
            production: 'production',
            development: 'development'
        }

        key = self.env_key_format( prefix, 'environment' )
        
        if ENV.keys.include?( hash[:detect] )
            ENV[ key ] = hash[:production]
        else
            ENV[ key ] = hash[:development]
        end
    end


    def self.secrets( prefix )
        key_env = self.env_key_format( prefix, 'environment' )

        case ENV[ key_env  ]
        when 'production'
            puts "Environment:   #{ENV[ key_env ]}"
        when 'development'
            tmp = File
                .read( './.env' )
                .split( "\n" )
                .map { | n | n.split( /=(.+)/ ) }
                .to_h

            secrets = tmp.inject( {} ) do | item, h | 
                k = self.env_key_format( prefix, h[ 0 ] )
                item[ k ] = h[ 1 ]
                item
            end

            secrets.keys.each do | key |
                ENV[ key ] = secrets[ key ]
            end

            puts "Environment:   #{ENV[ key_env ]}"
            puts "Secrets:       #{secrets.keys.length}"
        end
    end


    def self.rapidapi( messages, prefix, token )
        if token.class.eql?( String )
            s = ENV[ self.env_key_format( prefix, 'rapidapi_secret' ) ]
            if s.eql?( token )
            else
                messages.push( '- XRAPSecret not identical.' )
            end
        else
            messages.push( '- XRAPSecret not found.' )
        end
 
        return messages
    end


    private


    def self.env_key_format( prefix, key )
        "#{prefix}#{key}".upcase
    end
end