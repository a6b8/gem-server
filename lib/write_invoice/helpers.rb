module Helpers
    def self.payload_validation( params )
        messages = []
        validation = true
        message = ''
        mode = nil

        if params.keys.length == 0
            mode = 'payload:hash/options:hash'
            validation = true
        else
            keys = [ 'payload', 'options' ]
            values = [ 'hash', 'json' ]

            hash = params
                .select { | k, v | keys.include?( k ) }
                .select { | k, v | [ 'hash', 'json' ].include?( v ) }

            if hash.keys.length == 2
                tmp = keys
                    .map { | k | "#{k}:#{hash[k]}" }
                    .join( '/' )

                if ( [ 'payload:hash/options:hash', 'payload:json/options:hash' ] & [ tmp ] ) == [ tmp ]
                    mode = tmp
                else
                    validation = false
                    messages.push( "- #{tmp}: Your combination is not supported." )
                end
            else
                validation = false

                keys.each do | key |
                    if params.keys.include?( key )
                        test = values
                            .map { | value | params[ key ].eql?( value ) }
                            .include?( true )
        
                        if !test
                            case key
                            when 'payload'
                                m = "- Value of '#{key}': '#{params[key]}' is not supported. Use 'hash' or 'json' instead'. Note: 'json' is currently not full supported."
                            when 'options'
                                m = "- Value of '#{key}': '#{params[key]}' is not supported. Use 'hash' instead'."
                            else
                                m = "- Value of '#{key}': '#{params[key]}' is not supported."
                            end

                            messages.push( m )
                        end
                    else
                        messages.push( "- Key: '#{key}' not found" )
                    end
                end
            end
        end

        return [ validation, mode, messages ]
    end


    def self.document_validation( str )
        validation = false
        mode = nil
        messages = []
        hash = nil

        values = [ 'payload:hash/options:hash', 'payload:json/options:hash' ]
            .inject( {} ) { | item, k | item[ k ] = !str.index( k ).nil?; item }

        if !str.empty?
            if values.map { | k, v | v }.include?( true )
                validation = true
                values.each { | k, v | v ? mode = k : '' }
            else
                messages.push( "- Type not found. Use 'payload:hash/options:hash' or 'payload:json/options:hash' instead." )
            end
        else
            messages.push( "- Body is empty. Use Route 'payload?payload=hash&options=hash' to generate a payload first.")
        end


        case mode
        when 'payload:hash/options:hash'
            begin
                hash = eval( str )
            rescue
                validation = false
                messages.push( "- #{mode}: Parsing was not successful!" )
            end
        when 'payload:json/options:hash'
            begin
                hash = JSON.parse( str, :symbolize_names => true )
                hash[:options] = eval( hash[:options] )
            rescue
                validation = false
                messages.push( "- #{mode}: Parsing was not successful!" )
            end
        else
            validation = false
            messages.push( '- Something went wrong!' )
        end


        if validation
            keys = hash.keys

            [ [ :payload, 'payload' ], [ :options, 'options' ] ].each do | pair |
                if !pair.map { | k | keys.include?( k ) }.include?( true )
                    validation = false
                    messages.push( "- Key: '#{pair[ 0 ]}' is missing." )
                end
            end
        end

        return [ validation, mode, messages, hash ]
    end


    def self.error_output( messages )
        result = messages
            .join( "\n" )
            .insert( 0, "Error#{messages.length == 1 ? '' : 's' }:\n" )
        return result
    end
end