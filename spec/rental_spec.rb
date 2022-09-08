require './book'
require './teacher'
require './student'
require './rental'

describe Rental do
  before(:all) do
    @book = Book.new('The Book', 'The Author')
    @student = Student.new(19, 'Kevin', 'Class 1', 2)
    @rental = Rental.new(2006 / 0o4 / 12, @book, @student, 1)
  end

  it 'takes four parameters and returns a Rental object' do
    expect(@rental).to be_an_instance_of Rental
  end

  it 'returns the correct date' do
    expect(@rental.date).to eq 2006 / 0o4 / 12
  end

  it 'returns the correct book' do
    expect(@rental.book).to eq @book
  end

  it 'returns the correct person' do
    expect(@rental.person).to eq @student
  end

  it 'returns the correct id' do
    expect(@rental.id).to eq 1
  end
end
