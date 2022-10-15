require 'date'
require_relative 'book'
require_relative 'label'

class App
  attr_accessor :books, :lables

  def initialize
    @books = []
    @labels = []
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp.downcase
    print 'Publish Date (yyyy-mm-dd): '
    publish_date = gets.chomp

    print "\n Book Created Successfully 🎉 \n"
    book = Book.new(publisher, cover_state, publish_date)
    @books << book

    print "\nWould you like to add a label? (Y/N): "
    answer_label = gets.chomp
    if %w[Y YES].include?(answer_label.upcase)
      print 'Title: '
      title = gets.chomp
      print 'Color: '
      color = gets.chomp

      print "\n Label Created Successfully 🎉 \n"
      label = Label.new(title, color)
      @labels << label
    else
      print "\n"
    end
  end

  def list_books
    print "Books (#{@books.length}) ⬎ "
    print "\n currently no books here" if @books.empty?
    @books.each_with_index do |book, index|
      print "\n • [#{index}] #{book.date}, published by #{book.publisher}"
    end

    print "\n"
  end

  def list_labels
    print "Labels (#{@labels.length}) ⬎ "
    print "\n currently no labels here" if @labels.empty?
    @labels.each do |label|
      print "\n • #{label.title} - #{label.color}"
    end

    print "\n"
  end

  def store_book
    book_item = []
    @books.each do |bookit|
      book_item.push({ publisher: bookit.publisher, cover_state: bookit.cover_state, publish_date: bookit.date })
    end
    File.write('./classes/book.json', JSON.generate(book_item))
  end

  def store_label
    label_item = []
    @labels.each do |labelit|
      label_item.push({ title: labelit.title, color: labelit.color})
    end
    File.write('./classes/label.json', JSON.generate(label_item))
  end

  # def fetch_book
  #   if File.exist?('./classes/book.json')
  #     data = JSON.parse(File.read('./classes/book.json'))
  #     @books = data
  #   else
  #     puts '< book.json > file does not exist !'
  #   end
  # end

  # def fetch_label
  #   if File.exist?('./classes/label.json')
  #     data = JSON.parse(File.read('./classes/label.json'))
  #     @labels = data
  #   else
  #     puts '< label.json > file does not exist !'
  #   end
  # end

  def fetch_book
    books_file = File.read('./classes/book.json')
    return if books_file.empty?

    new_books = JSON.parse(books_file)
    new_books.each do |book|
      @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
    end
  end

  def fetch_label
    label_file = File.read('./classes/label.json')
    return if label_file.empty?

    new_label = JSON.parse(label_file)
    new_label.each do |label|
      @labels << Label.new(label['title'], label['color'])
    end
  end
end
