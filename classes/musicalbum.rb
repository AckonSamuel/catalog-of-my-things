require 'item'

class MusicAlbum < Item
  def initialize(on_spotify: true)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
    @piece = ''
  end

  def distract
    @piece = {
                      genre: @genre,
                      author: @author,
                      label: @label,
                      source: @source,
                      publish_date: @publish_date,
                      on_spotify: @on_spotify
                    }
  end

  def unveil
    return unless @piece.length
      @piece.each do |key, value|
        puts "\n#{key} : #{value},\n"
      end
    end
  end

  private

  def can_be_archived?
    @archived == true && on_spotify == true
  end
end
