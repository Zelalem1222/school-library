require_relative './data_values'
require_relative './rental'
require_relative './data_init'
require 'json'

class RentalsLogic
  include Data

  attr_accessor :rentals, :books, :people

  def initialize
    @rentals = Data.rentals
    @books = Data.books
    @people = Data.peoples
    @data_init = DataInit.new
  end

  # rubocop:disable Metrics/MethodLength
  def create_rental
    @data_init.book_restore
    @data_init.people_restore
    @data_init.rentals_init
    @data_init.rentals_restore
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
    new_rental = Rental.new(rental_date, @books[book_no], @people[person_no], @people[person_no].id)

    rented_book = @books[book_no]
    book = { 'title' => rented_book.title, 'author' => rented_book.author }

    person_sel = @people[person_no]
    person = { 'class' => person_sel.class, 'id' => person_sel.id, 'age' => person_sel.age, 'name' => person_sel.name }

    @data_init.new_rental(rental_date, book, person)

    @rentals.push(new_rental)
    puts 'Rental added successfully!'
  end

  # rubocop:enable Metrics/MethodLength
  def list_all_rentals
    @data_init.rentals_init
    @data_init.book_restore
    @data_init.people_restore
    @data_init.rentals_restore
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rented Books: '
    @rentals.each do |rental|
      next unless rental.person['id'] == id

      # rubocop:disable Layout/LineLength
      puts "Person: #{rental.person['name']} Date: #{rental.date}, Book: '#{rental.book['title']}' by #{rental.book['author']}"
      # rubocop:enable Layout/LineLength
    end
  end
end
