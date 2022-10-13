class AppAlbum
  attr_accessor :albums

  def initialize
    @albums = []
    @genres = []
  end

  def add_album
    puts 'Creating a new music album'
    puts

    # add genre
    puts 'Enter genre name: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre unless @genres.include?(genre)


    print 'Is the album on Spotify[Y/N]: '
    spot = gets.chomp.downcase
    puts 'Sorry, invalid input' unless %w[y n].include?(spot)
    light = false
    spot == 'y' ? !light : light

    puts 'Input Published date e.g. 2021-01-01'
    print 'Date: '
    date = gets.chomp
    puts 'Sorry, You input invalid date' unless date.match?(/\d{4}-\d{2}-\d{2}/)

    new_album = MusicAlbum.new(date, on_spotify: light)

    @albums << new_album
  end

  def list_albums
    if @albums.length.positive?
        @albums.each_with_index do |album, index|
            puts "#{index}). On-spotify: #{album.on_spotify}, Publication Date: #{album.publish_date}"
        end
    else
        puts
        puts 'No music albums available'
    end
    sleep(1)
    puts
  end
  
end
