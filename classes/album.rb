require_relative 'item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify: true)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    @archived == true && on_spotify == true
  end
end
