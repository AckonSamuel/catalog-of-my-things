require 'item'

class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = rand(1...999)
    @name = name
    @items = []
  end

  def add_item(items)
    case items
    when Item
      items.add_genre(self)
      @items << items
    else
      puts 'Class error: Must either be a book, game, music album, or movie'
    end
  end
end
