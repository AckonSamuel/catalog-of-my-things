require 'class_collection'

class App
    def initialize
        @books = []
        @music_albums = []
        @games = []

    end

    def add_album
        print 'Genre: '
        genre = gets.chomp
        print 'Author: '
        author = gets.chomp
        print 'Source: '
        source = gets.chomp
        print 'Label: '
        label = gets.chomp
        puts 'Input date e.g. 2021-01-01'
        print 'Date: '
        publish_date = gets.chomp
        puts 'Sorry, You input invalid date' unless publish_date.match?(/\d{4}-\d{2}-\d{2}/)
        new_album = MusicAlbum.new(genre, author, source, label, publish_date)
        @music_albums << new_album
    end

    def list_album
        return unless @music_albums.length 

        @music_album.each do 
            puts 'Album: '
             |album|  album&.distract&.unveil
        end
    end
              

end
