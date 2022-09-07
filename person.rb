require_relative './nameable'

class Person < Nameable
  def initialize(age, name, id)
    @id = id
    @name = name
    @age = age
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private :of_age?
  public :can_use_services?
  attr_reader :id
  attr_accessor :name, :age, :rentals
end
