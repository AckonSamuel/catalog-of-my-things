# require './entity/item'

class Main
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def input_check(number)
    case number
    when 1
      puts 'List all books'
    when 2
      puts 'List all music albums'
    when 3
      puts '3'
    when 4
      puts '4'
    when 5
      puts '5'
    when 6
      puts '6'
    when 7
      puts '7'
    when 8
      puts '8'
    when 9
      puts '9'
    when 0
      puts '*** Thanks for using program ***'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  def entry_text
    puts 'Welcome to my Catalog'

    puts '1- List all books
2- List all music albums
3- List of games
4- Add a book
5- Add a music album
6- Add a game
7- List all genres
8- List all labels
9- List all authors
0- Exit'

    print 'Choose an Option [0 - 9] : '
  end

  def entry_point
    entry_text
    choose = gets.chomp.to_i
    input_check(choose)
  end
end

# List all books
# List all music albums
# List of games
# List all genres
# List all labels
# List all authors
# Add a book
# Add a music album
# Add a game

enry = Main.new
enry.entry_point
