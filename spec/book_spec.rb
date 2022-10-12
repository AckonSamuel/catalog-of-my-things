require_relative '../classes/book'
require_relative '../classes/item'
require 'date'

describe Book do
  before(:each) do
    @book = Book.new('Harry Potter', 'good', '1999-01-10', false)
  end

  context '#new' do
    it 'should initialize' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should assign right properties' do
      expect(@book).to have_attributes(
        publisher: 'Harry Potter',
        cover_state: 'good',
        publish_date: Date.iso8601('1999-01-10'),
        archived: false
      )
    end

    it 'should be a sub-class of Item' do
      expect(@book.class).to be < Item
    end
  end

  context '#move_to_archive' do
    it 'should move book to archive' do
      @book.move_to_archive
      expect(@book.archived).to eq true
    end
  end
end