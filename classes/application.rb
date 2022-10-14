require_relative 'class_collection'
require 'json'

class Application
  def initialize
    @game = []
    @author = []
  end

  def multyplayer?
    print 'Is this game Multiplayer ? [ Y/N ] : '
    check = gets.chomp.downcase
    case check
    when 'y'
      true
    when 'n'
      false
    else
      puts 'You entered invaled input ! '
      multyplayer?
    end
  end

  def add_game
    puts '---- Add new Game ----'
    multyplayer = multyplayer?
    print 'Enter last played (yyyy-mm-dd): '
    last_played = gets.chomp
    print 'Enter Publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    new_game = Game.new(multyplayer, last_played, publish_date)
    add_author(new_game)
    @game.push({
                 'id' => new_game.id,
                 'archived' => new_game.archived,
                 'multiplayer' => new_game.multiplayer,
                 'last_played' => new_game.last_played,
                 'published' => new_game.date
               })
    puts '---- Game added to storage  ----'
  end

  def add_author(item)
    puts '---- Add new Author ----'
    print 'Enter first name : '
    first_name = gets.chomp
    print 'Enter last name : '
    last_name = gets.chomp
    check_for_add_author(first_name, last_name, item)
  end

  # rubocop:disable Metrics/MethodLength
  def check_for_add_author(f_name, l_name, game)
    full_name = "#{f_name} #{l_name}"
    author_exist = false
    @author.each do |author|
      author_name = "#{author['first_name']} #{author['last_name']}"
      author_exist = true if author_name == full_name
    end
    if author_exist
      @author.each do |author|
        author_name = "#{author['first_name']} #{author['last_name']}"
        next unless author_name == full_name

        author['items'].push({
                               'id' => game.id,
                               'multiplayer' => game.multiplayer,
                               'archived' => game.archived,
                               'published' => game.date
                             })
      end
    else
      new_author = Author.new(f_name, l_name)
      new_author.add_item({
                            'id' => game.id,
                            'multiplayer' => game.multiplayer,
                            'archived' => game.archived,
                            'published' => game.date
                          })
      @author.push({
                     'id' => new_author.id,
                     'first_name' => new_author.first_name,
                     'last_name' => new_author.last_name,
                     'items' => new_author.items
                   })
    end
  end
  # rubocop:enable Metrics/MethodLength

  def game_list
    puts '---------- Game List -----------'
    @game.each_with_index do |game, index|
      puts "#{index + 1} - ID : #{game['id']}
    Multiplayer: #{game['multiplayer']}
    Archived: #{game['archived']}
    Publish date: #{game['published']}"
    end
    puts '-----------------'
  end

  def author_list
    puts '--------- Author List -----------'
    @author.each_with_index do |author, index|
      puts "#{index + 1} - ID : #{author['id']} Name: #{author['first_name']} #{author['last_name']}
    Author of Games:"
      author['items'].each do |game|
        puts "- ID: #{game['id']}, Multiplay: #{game['multiplayer']}"
      end
    end
    puts '-----------------'
  end

  def store_games
    File.write('./classes/game.json', JSON.generate(@game))
  end

  def store_author
    File.write('./classes/author.json', JSON.generate(@author))
  end

  def fetch_game
    if File.exist?('./classes/game.json')
      data = JSON.parse(File.read('./classes/game.json'))
      @game = data
    else
      puts '< game.json > file does not exist !'
    end
  end

  def fetch_author
    if File.exist?('./classes/author.json')
      data = JSON.parse(File.read('./classes/author.json'))
      @author = data
    else
      puts '< author.json > file does not exist !'
    end
  end
end
