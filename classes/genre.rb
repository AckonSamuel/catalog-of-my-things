require 'item'

class Genre 

    def initialize(name)
        @id = rand(1...999)
        @name = name
        @items = []
    end

    def add_items
    end
end
