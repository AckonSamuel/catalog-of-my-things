require_relative '../classes/book'
require_relative '../classes/item'
require 'date'

describe Book do
  before(:each) do
    @book = Book.new('Charles', 'bad', '2020-01-10')
  end

  context '#new' do
    it 'should initialize' do
      expect(@book).to be_an_instance_of Book
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
