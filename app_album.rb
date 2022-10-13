
class AppAlbum 
    attr_accessor :albums
    def initialize
        @albums = []
    end

def add_album
    puts 'Creating a new music album'
    puts
    print 'Is the album on Spotify[Y/N]: '
    spot  = gets.chomp.downcase
    puts 'Sorry, invalid input' unless spot == 'y' || spot == 'n'
    light = false
    spot == 'y' ? light = true : light

    puts 'Input Published date e.g. 2021-01-01'
    print 'Date: '
    date = gets.chomp
    puts 'Sorry, You input invalid date' unless date.match?(/\d{4}-\d{2}-\d{2}/)
   
    new_album = MusicAlbum.new(date, on_spotify: light)

    @albums << new_album
end

end

