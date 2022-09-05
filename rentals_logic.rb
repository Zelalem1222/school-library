require_relative './data_values'
require_relative './rental'



class RentalsLogic
include Data

attr_accessor :rentals , :books , :people

  def initialize
    @rentals = Data.rentals
    @books = Data.books
    @people = Data.peoples
  end

  def create_rental
    puts 'Select a number from the following books: '
    @books.each_with_index { |book, index| puts "#{index}- Title: \"#{book.title}\" , Author: #{book.author} " }
    book_no = gets.chomp.to_i
    puts 'Select person from the following by number: '
    @people.each_with_index do |p, index|
      puts "#{index} - [#{p.class}] Name: #{p.name} , ID: #{p.id} , Age: #{p.age} "
    end
    person_no = gets.chomp.to_i
    print 'Date (yy/mm/dd): '
    rental_date = gets.chomp
    new_rental = Rental.new(rental_date, @books[book_no], @people[person_no])
    @rentals.push(new_rental)
    puts 'Rental added successfully!'
  end

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"

      else
        puts 'No records where found for the given ID'
      end
    end
  end
end