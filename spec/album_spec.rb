require_relative '../classes/album'

describe MusicAlbum do
  it ' MusicAlbum class test' do
    album = MusicAlbum.new('2020-09-01')

    expect(album).to be_an_instance_of MusicAlbum

    # expect(game).to be_an_instance_of Game
  end
end
