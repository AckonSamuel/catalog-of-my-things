require 'date'

class Item
  attr_accessor :date

  def initialize(publish_date, archived)
    @id = rand(1..999)
    @date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
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
    return if @date.empty?

    date = Date.parse(@date)
    now = Date.today
    (now&.year&.- date.year) > 10
  end
end
