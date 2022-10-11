def main
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
  when 1..9
    print 'Coming Soon...'
  when 0
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
