require 'item'

class MusicAlbum < Item

    def initialize(on_spotify: true)
        super(genre, author, source, label, publish_date)
        @on_spotify = on_spotify
        @music_arr = []
    end

    def add_album
        @music_arr.push({
            genre: @genre,
            author: @author,
            label: @label,
            source: @source,
            publish_date: @publish_date,
            on_spotify: @on_spotify,
        })
    end

    def list_album
        @music_arr.each do |piece|
            piece.each do |key, value| puts "\n{#{key} : #{value}},\n"
            end
        end if @music_arr.length
    end

    private

    def can_be_archived?
     @archived == true && on_spotify == true
    end
end
