require_relative '../classes/game'

describe Game do
  it 'Game class test' do
    game = Game.new(true, '2022-10-12', '2019-01-01', true)

    expect(game.multiplayer).to be_truthy

    expect(game).to be_an_instance_of Game
  end
end