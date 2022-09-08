class Rental
  attr_accessor :date
  attr_reader :book, :person, :id

  def initialize(date, book, person, id)
    @date = date

    @book = book

    @person = person

    @id = id
  end
end
