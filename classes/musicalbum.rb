require 'item'

class MusicAlbum < Item
  def initialize(on_spotify: true)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
    @music_arr = []
  end

  def add_album
    {
                      genre: @genre,
                      author: @author,
                      label: @label,
                      source: @source,
                      publish_date: @publish_date,
                      on_spotify: @on_spotify
                    }
  end

  def list_album
    return unless @music_arr.length

    @music_arr.each do |piece|
      piece.each do |key, value|
        puts "\n{#{key} : #{value}},\n"
      end
    end
  end

  private

  def can_be_archived?
    @archived == true && on_spotify == true
  end
end
