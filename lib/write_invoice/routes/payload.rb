module Payload
    def self.generate( mode, messages, item, example )
        struct = nil
        begin
            payload = WriteInvoice::Example.generate( 
                articles_total: item[:articles_total],
                invoices_total: item[:invoices_total],
                debug: false )

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
            when 'payload:json/options:hash'
                struct[:options] = example[:options].to_s
                struct = JSON.pretty_generate( struct )
            else
                messages.push( '- Payload: Type not correct!' )
            end
        rescue
            messages.push( '- Something went wrong, internal error.' )
        end

        return struct, messages
    end


    def self.validation( params, plan )
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
                    begin
                        n = Integer( params[ key ] )
                        case key
                        when 'articles_total'
                            if !n.between?( 1, plan[:articles_total] )
                                messages.push( "- #{key}: is not in between 1 and #{plan[:articles_total]}" )
                            end
                        when 'invoices_total'
                            if !n.between?( 1, plan[:invoices_total] )
                                messages.push( "- #{key}: is not in between 1 and #{plan[:invoices_total]}" )
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
end