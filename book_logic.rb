require './data_values'
require './book'
require 'json'

class BookLogic
  include Data

  attr_accessor :books

  def initialize
    @books = Data.books
  end

  def add_to_data(title, author)
    path = './store/books.json'
    file = File.new(path, 'w')
    File.write(path, '[]')
    file = File.open(path, 'r')

    # loaded_books = JSON.parse(file.read)

    loaded_books = []

    @books.each do |book|
      loaded_books << {"title" => book.title, "author" => book.author}
    end


    loaded_books << {"title" => title, "author" => author}

    File.open(path, 'w') do |f|
      f.write(loaded_books.to_json) 
    end      

  end

  def load_book_data
    path = './store/books.json'
    if File.exists?(path) && File.size(path) != 2
          file = File.open(path , 'r')
          loaded_books = JSON.parse(file.read)
          loaded_books.each do |b|
          book = Book.new(b['title'], b['author'])
          @books.push(book)
          end
          # @books = []
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
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    add_to_data(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end
end
