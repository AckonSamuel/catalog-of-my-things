require './classes/application'
require_relative 'app_album'
require_relative './classes/app'

NEW_APP = AppAlbum.new
def main
  @app = Application.new
  @app.fetch_game
  @app.fetch_author
  @app_book = App.new
  @app_book.fetch_book
  @app_book.fetch_label
  print "\nWelcome to catalog of my things\n"
  loop do
    print_options
    option = gets.chomp.to_i

    handle_case(option)

    break if option.zero?
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
def handle_case(option) # rubocop:disable Metrics/MethodLength
  case option
  when 1
    @app_book.list_books
  when 2
    NEW_APP.list_albums
  when 3
    @app.game_list
  when 4
    NEW_APP.list_genres
  when 5
    @app_book.list_labels
  when 6
    @app.author_list
  when 7
    @app_book.add_book
  when 8
    NEW_APP.add_album
  when 9
    @app.add_game

  when 0
    @app.store_games
    @app.store_author
    @app_book.store_book
    @app_book.store_label
    print 'Thanks for using the app!'
  else
    print "Invalid option... Choose one of the options above\n"
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def print_options
  puts "
    1. List all books
    2. List all music albums
    3. List of games
    4. List all genres
    5. List all labels
    6. List all authors
    7. Add a book
    8. Add a music album
    9. Add a game
    0. Exit
    "
end

main
