require_relative 'item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
    move_to_archive
  end

  private

  def can_be_archived?
   super && @on_spotify
  end
end
