require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './book_logic'

class App
  attr_accessor :people, :books_class, :rentals

  def initialize
    @people = []
    @books_class = BookLogic.new
    @rentals = []
  end

  def list_all_people
    if @people.size.positive?
      puts 'Here is the list'
      @people.each_with_index do |p, index|
        puts "#{index} - [#{p.class}] Name: #{p.name} , ID: #{p.id} , Age: #{p.age} "
      end
    else
      puts 'There are no people registered'
    end
    gets.chomp
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_class = gets.chomp
    case person_class
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts 'Person created successfully'
    gets
  end

  def yes_no(input)
    case input
    when 'Y'
      true
    when 'N'
      false
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Has parent permission? [Y/N]: '
    parent = gets.chomp.capitalize
    person = Student.new(age, name, yes_no(parent), nil)
    @people.push(person)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    teacher = Teacher.new(age, name, nil, specialization)
    @people.push(teacher)
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
    run
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
    run
  end
end
