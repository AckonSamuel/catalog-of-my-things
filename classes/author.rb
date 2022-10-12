require_relative 'item'

class Author
  attr_accessor :first_name, :last_name

  attr_reader :id, :items

  def initialize(f_name, l_name)
    @id = Random.rand(1..1000)

    @first_name = f_name

    @last_name = l_name

    @items = []
  end

  def add_item(new_item)
    @items << (new_item)
  end
end
