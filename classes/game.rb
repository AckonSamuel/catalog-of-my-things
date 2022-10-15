require_relative 'item'
require 'date'

class Game < Item
  attr_reader :multiplayer, :last_played

  def initialize(multiplayer, last_played, publish_date)
    super(publish_date)

    @multiplayer = multiplayer
    @last_played = last_played
    move_to_archive
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played).year) > 2
  end
end
