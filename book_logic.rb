require './data_values'
require './book'

class BookLogic
  include Data

  attr_accessor :books

  def initialize
    @books = Data.books
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
    @books.push(book)
    puts 'Book created successfully'
  end
end
