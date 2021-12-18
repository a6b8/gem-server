module Helpers
    def self.example()
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


    def self.messages( messages )
        result = messages
            .join( "\n" )
            .insert( 0, "The following error#{messages.length == 1 ? '' : 's' } occurred:\n" )
            .concat( "\n\nVisit: https://docs.writeinvoice.com for more Informations.")
        return result
    end


    def self.logo( url )
        uri = URI( url )
        response = Net::HTTP.get( uri )
        file = Base64.encode64( response )
        return file
    end
end