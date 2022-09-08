require './person'

describe Person do
  before(:each) do
    @person = Person.new(18, 'John', 1)
  end

  it 'takes three parameters and returns a Person object' do
    expect(@person).to be_an_instance_of Person
  end

  it 'returns the correct id' do
    expect(@person.id).to eq 1
  end

  it 'returns the correct name' do
    expect(@person.name).to eq 'John'
  end

  it 'returns the correct age' do
    expect(@person.age).to eq 18
  end

  it 'returns the correct number of rentals' do
    expect(@person.rentals).to eq []
  end

  it 'returns the correct name' do
    expect(@person.correct_name).to eq 'John'
  end

  it 'returns true if the person is of age' do
    expect(@person.can_use_services?).to eq true
  end
end
