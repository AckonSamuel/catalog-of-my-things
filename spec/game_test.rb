require_relative '../classes/game'
require 'date'

describe Game do
  it 'Game class 1st test' do
    game = Game.new(true, '2019-10-12', '2011-01-01')

    expect(game.multiplayer).to be_truthy

    expect(game.archived).to be_truthy

    expect(game).to be_an_instance_of Game
  end

  it 'Game class  2nd test' do
    game = Game.new(false, '2019-10-12', '2019-01-01')

    expect(game.multiplayer).to be_falsey

    expect(game.archived).to be_falsey

    expect(game).to be_an_instance_of Game
  end
end
