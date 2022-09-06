require './data_values'
require './book'
require './data_init'
require 'json'

class BookLogic
  include Data

  attr_accessor :books

  def initialize
    @books = Data.books
    @data_init = DataInit.new
  end

  def add_to_data(title, author)
    @data_init.book_init
    @data_init.new_book(title, author)
  end

  def load_book_data
    File.exist?('./store/books.json') ? @data_init.book_restore : @data_init.book_init
  end

  def list_all_books
    load_book_data
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
