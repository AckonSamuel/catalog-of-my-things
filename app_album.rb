require 'json'
require_relative './classes/class_collection'

class AppAlbum
  attr_accessor :albums, :genres

  def initialize
    @albums = []
    @genres = []
    load_genres
    load_albums
  end

  def add_album # rubocop:disable Metrics/MethodLength
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


    @album_arr = []
    @genres_arr = []

    @albums.each do |album|
      @album_arr.push({ date: album.date, on_spotify: album.on_spotify })
    end
    File.write('./albums.json', JSON.dump(@album_arr))

    @genres.each do |genre|
      @genres_arr.push({ name: genre.name})
    end
    File.write('./genres.json', JSON.dump(@genres_arr))
  end

  def list_albums
    if @albums.length.positive?
      @albums.each_with_index do |album, index|
        puts "#{index}). On-spotify: #{album.on_spotify}, Publication Date: #{album.date}"
      end
    else
      puts
      puts 'No music albums available'
    end
    sleep(1)
    puts
  end

  def list_genres
    if @genres.length.is_positive?
      @genres.each do |genre|
        puts genre.name.to_s
      end
    else
      puts 'No genres available'
    end
  end

  def load_albums
    albums_file = File.read('./albums.json')
    return unless albums_file.length.positive?

    new_albums = JSON.parse(albums_file)
    new_albums.each do |album|
      @albums << MusicAlbum.new(album['date'], on_spotify: album['on_spotify'])
    end
  end

  def load_genres
    genre_file = File.read('./albums.json')
    return unless genre_file.length.positive?

    new_genre = JSON.parse(genre_file)
    new_genre.each do |genre|
      @genres << Genre.new(genre['name'])
    end
  end
end
