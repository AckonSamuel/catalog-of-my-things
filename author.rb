require './entity/item'

class Author < Item
  attr_accessor :first_name, :last_name, :items

  attr_reader :id

  def initialize(f_name, l_name, publish_date)
    super(publish_date)

    @id = Random.rand(1..1000)

    @first_name = f_name

    @last_name = l_name

    @items = []
  end

  def add_item(new_item)
    @items << (new_item)
  end
end
