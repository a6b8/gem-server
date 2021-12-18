module Document
    def self.validation( str, plan )
        mode = nil
        messages = []
        hash = nil

        values = [ 'payload:hash/options:hash', 'payload:json/options:hash' ]
            .inject( {} ) { | item, k | item[ k ] = !str.index( k ).nil?; item }

        if !str.empty?
            if values.map { | k, v | v }.include?( true )
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
                messages.push( "- #{mode}: Parsing was not successful!" )
            end
        when 'payload:json/options:hash'
            begin
                hash = JSON.parse( str, :symbolize_names => true )
                hash[:options] = eval( hash[:options] )
            rescue
                messages.push( "- #{mode}: Parsing was not successful!" )
            end
        else
            messages.push( '- Something went wrong!' )
        end


        if messages.empty?
            keys = hash.keys

            if hash.keys.include?( :payload )
                if hash[:payload].keys.include?( :invoices )
                    hash[:payload][:invoices].empty? ? messages.push( "- Payload: No invoice found." ) : ''
                    if !( hash[:payload][:invoices].length > plan[:invoices_total] )
                        hash[:payload][:invoices].each.with_index do | invoice, index |
                            if invoice.keys.include?( :items )
                                if invoice[:items].keys.include?( :articles )
                                    if !(invoice[:items][:articles].length > plan[:articles_total])
                                        
                                    else
                                        messages.push( "- Payload: Not more then '#{plan[:articles_total]}' articles are allowed." )
                                    end
                                else
                                    messages.push( "- Payload: Invoice[#{index}]['items'] key 'articles' not found" )
                                end
                            else
                                messages.push( "- Payload: Invoice[#{index}] key 'items' not found" )
                            end
                        end
                    else
                        s =  "- Payload: Only #{plan[:invoices_total]} "
                        s += "invoice#{plan[:invoices_total] > 1 ? 's' : ''} "
                        s += "per document #{plan[:invoices_total] > 1 ? 'are' : 'is'} allowed."
                        messages.push( s )
                    end
                else
                    messages.push( "- Payload: key ':invoices' not found.")
                end
            else
                messages.push( "- Key 'payload' is missing." )
            end
    

            if hash.keys.include?( :options )
                if hash[:options].class.eql?( Hash )        
                    keys = hash[:options].keys
                    keys.concat( keys.map { | a | a.to_s } )
        
                    plan[:checks].each do | k, v |
                        if keys.include?( k ) or keys.include?( k.to_s )
                            if !hash[:options][ k ].eql?( v )
                                messages.push( "- #{k} can not be changed, set to '#{v}'. Use our premium services to upgrade your account." )
                            end
                        end
        
                        hash[:options][ k ] = v
                    end
                else
                    messages.push( "- options is not type 'Hash'")
                end
            else
                messages.push( "- Key 'options' is missing." )
            end


        end

        return [ messages, hash ]
    end
end