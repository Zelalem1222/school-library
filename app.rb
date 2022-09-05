require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './book_logic'
require_relative './person_logic'
require_relative './rentals_logic'

class App
  attr_accessor :people_class, :books_class, :rentals

  def initialize
    @people_class = PersonLogic.new
    @books_class = BookLogic.new
    @rentals = RentalsLogic.new
  end
end
