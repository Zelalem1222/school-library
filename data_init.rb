require 'json'
require './data_values'

class DataInit
  attr_accessor :books

  include Data

  def initialize
    @books = Data.books
    @people = Data.peoples
    @books_path = './store/books.json'
    @persons_path = './store/people.json'
    @rentals = Data.rentals
    @rentals_path = './store/rentals.json'
  end

  def book_init
    File.exist?(@books_path) ? book_restore : File.write(@books_path, '[]')
  end

  def people_init
    File.exist?(@persons_path) ? people_restore : File.write(@persons_path, '[]')
  end
  
  def rentals_init
    File.exist?(@rentals_path) ? rentals_restore : File.write(@rentals_path, '[]')
  end

  def book_restore
    return unless File.size(@books_path) != 2 && @books.empty?

    file = File.open(@books_path, 'r')
    loaded_books = JSON.parse(file.read)
    loaded_books.each do |book|
      bd = Book.new(book['title'], book['author'])
      @books.push(bd)
    end
  end

  def people_restore
    return unless File.size(@persons_path) != 2 && @people.empty?

    file = File.open(@persons_path, 'r')
    loaded_people = JSON.parse(file.read)
    loaded_people.each do |person|
      pd = if person['class'] == 'Student'
             Student.new(person['age'], person['name'], nil)
           else
             Teacher.new(person['age'], person['name'], person['specialization'])
           end
      @people.push(pd)
    end
  end

  def rentals_restore
    return unless File.size(@rentals_path) != 2 && @rentals.empty?

    file = File.open(@rentals_path, 'r')
    loaded_rentals = JSON.parse(file.read)
    loaded_rentals.each do |rental|
      rd = Rental.new(rental['date'], rental['book'], rental['person'])
      @rentals.push(rd)
    end
  end

  def new_book(title, author)
    load_file = File.open(@books_path, 'r')
    loaded_books = JSON.parse(load_file.read)
    loaded_books << { 'title' => title, 'author' => author }
    File.write(@books_path, loaded_books.to_json)
  end

  def new_student(age, name)
    load_file = File.open(@persons_path, 'r')
    loaded_people = JSON.parse(load_file.read)
    loaded_people << { 'class' => 'Student', 'age' => age, 'name' => name, 'classroom' => nil }
    File.write(@persons_path, loaded_people.to_json)
  end

  def new_teacher(age, name, specialization)
    load_file = File.open(@persons_path, 'r')
    loaded_people = JSON.parse(load_file.read)
    loaded_people << { 'class' => 'Teacher', 'age' => age, 'name' => name, 'specialization' => specialization }
    File.write(@persons_path, loaded_people.to_json)
  end

  def new_rental(date, book, person)
    
    load_file = File.open(@rentals_path, 'r')
    loaded_rentals = JSON.parse(load_file.read)
    loaded_rentals << { 'date' => date, 'book' => book, 'person' => person }
    File.write(@rentals_path, loaded_rentals.to_json)
  
end

end
