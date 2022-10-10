class Item
    def initialize(genre, author, source, label, publish_date)
        @id = 0
        @genre = genre
        @author = author
        @source = source
        @label = label
        @date = publish_date
        archived = true
    end
end