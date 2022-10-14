require './classes/application'
require_relative 'app_album'

NEW_APP = AppAlbum.new
def main
  @app = Application.new
  @app.fetch_game
  @app.fetch_author
  print "\nWelcome to catalog of my things\n"
  loop do
    print_options
    option = gets.chomp.to_i

    handle_case(option)

    break if option.zero?
  end
end

def handle_case(option)
  case option
  when 3
    @app.game_list
  when 6
    @app.author_list
  when 9
    @app.add_game
  when 1
    NEW_APP.add_album
  when 2
    NEW_APP.list_albums
  when 4
    NEW_APP.list_genres

  when 0
    @app.store_games
    @app.store_author
    print 'Thanks for using the app!'
  else
    print "Invalid option... Choose one of the options above\n"
  end
end

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
