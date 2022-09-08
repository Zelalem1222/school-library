require './book'

describe Book do
  before(:each) do
    @book = Book.new('The Book', 'The Author')
  end

  it 'takes three parameters and returns a Book object' do
    expect(@book).to be_an_instance_of Book
  end

  it 'returns the correct title' do
    expect(@book.title).to eq 'The Book'
  end

  it 'returns the correct author' do
    expect(@book.author).to eq 'The Author'
  end
end
