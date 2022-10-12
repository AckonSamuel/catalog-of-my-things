require_relative 'item'
require 'time'

class Game < Item
  attr_reader :multiplayer, :last_played

  def initialize(multiplayer, last_played, publish_date, archived)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played = last_played
  end
  private :can_be_archived?
  def can_be_archived?
    now = Time.now
    last_played = Time.parse(@last_played)
    super && (now - last_played) / 60 / 60 / 24 / 365 > 2
  end
end
