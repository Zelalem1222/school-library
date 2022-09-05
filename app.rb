require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './book'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def options
    puts 'Please choose an option by enterin a number :'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
    gets.chomp
  end

  def run
    choose = options
    case choose
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    else
      puts 'Thank You for using the app.'
      exit
    end
  end

  def list_all_books
    if @books.size.positive?
      puts 'Here are the books registered :'
      @books.each_with_index do |book, index|
        puts "#{index}- Title: \"#{book.title}\" , Author: #{book.author} "
      end
    else
      puts 'Sorry No book registered. Try after adding a book'
    end
    gets.chomp
    run
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
    run
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    run
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
    run
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
