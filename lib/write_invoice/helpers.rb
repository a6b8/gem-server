module Helpers
    def self.example_prepare()
        alphabet = ( 'a'..'z' ).to_a
        result = Blocks.options
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
        return result
    end


    def self.payload_validation( params )
        messages = []
        mode = nil
        item = {
            articles_total: 1..1,
            invoices_total: 1..1
        }

        if params.keys.length == 0
            mode = 'payload:hash/options:hash'
        else

            k = params.keys
            [ 'articles_total', 'invoices_total' ].each do | key |
                if k.include?( key )
                    puts 'HERE'
                    begin
                        n = Integer( params[ key ] )
                        case key
                        when 'articles_total'
                            if !n.between?( 1, 100 )
                                messages.push( "- #{key}: is not in between 1 and 100" )
                            end
                        when 'invoices_total'
                            if !n.between?( 1, 10 )
                                messages.push( "- #{key}: is not in between 1 and 10" )
                            end
                        else
                            messages.push( "- #{key}: Internal Error")
                        end

                        item[ key.to_sym ] = ( n..n )
                    rescue
                        messages.push( "- #{key}: is not type 'Integer'." )
                    end
                end
            end


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

                    messages.push( "- #{tmp}: Your combination is not supported." )
                end
            else

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

        return [ mode, messages, item ]
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

        return [ messages, hash ]
    end


    def self.document_freeium( hash, messages )
        if hash[:payload].keys.include?( :invoices )
            case hash[:payload][:invoices].length
            when 0
                messages.push( "- No invoice found. Use Route 'payload?payload=hash&options=hash' to generate a payload first." )
            when 1

                if hash[:payload][:invoices][ 0 ].keys.include?( :items )
                    if hash[:payload][:invoices][ 0 ][:items].keys.include?( :articles )
                        if hash[:payload][:invoices][ 0 ][:items][:articles].length > 10
                            messages.push( "- Not more then '10' articles are allowed. Use our premium services to upgrade your account." )
                        end
                    else
                        messages.push( "- 'Articles' in 'Invoices > Items' not found." )
                    end
                else
                    messages.push( "- 'Items' in 'Invoices' not found." )
                end
            else
                messages.push( "- Only 'one' invoice per document is allowed. Use our premium services to upgrade your account." )
            end
        else
            messages.push( "- Payload: ':invoices' not found. Use Route 'payload?payload=hash&options=hash' to generate a payload first.")
        end

        if hash[:options].class.eql?( Hash )
            checks = {
                show__unencrypted: false,
                show__watermark: true,
                text__watermark: 'Example',
                style__watermark__font_size: 180
            }

            keys = hash[:options].keys
            keys.concat( keys.map { | a | a.to_s } )

            checks.each do | k, v |
                if keys.include?( k ) or keys.include?( k.to_s )
                    if !hash[:options][ k ].eql?( v )
                        messages.push( "- #{k} can not be changed, set to '#{v}'. Use our premium services to upgrade your account." )
                    end
                end

                hash[:options][ k ] = v
            end
        else
            messages.push( "- hash[:options] is not type 'Hash'")
        end
        

        return messages
    end


    def self.error_output( messages )
        result = messages
            .join( "\n" )
            .insert( 0, "Error#{messages.length == 1 ? '' : 's' }:\n" )
        return result
    end
end