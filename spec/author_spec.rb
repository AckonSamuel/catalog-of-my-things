require_relative '../classes/author'

describe Author do
  it 'Author class test' do
    author = Author.new('Alan', 'abdulla')

    expect(author.first_name).to eq 'Alan'
    expect(author).to be_an_instance_of Author
  end
end