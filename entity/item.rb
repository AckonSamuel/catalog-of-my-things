require 'date'

class Item
  attr_accessor :date

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..9999)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = true
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_genre(new_genre)
    @genre = new_genre
  end

  def add_author(new_author)
    @author = new_author
  end

  def add_label(new_label)
    @label = new_label
  end

  def add_source(new_source)
    @source = new_source
  end

  private

  def can_be_archived?
    return if @publish_date.empty?

    date = Date.parse(@publish_date)
    now = Date.today
    (now&.year&.- date.year) > 10
  end
end
