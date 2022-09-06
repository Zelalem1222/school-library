require 'json'
require './data_values'

class DataInit
  attr_accessor :books

  include Data

  def initialize
    @books = Data.books
    @path = './store/books.json'
  end

  def book_init
    File.exist?(@path) ? book_restore : File.write(@path, '[]')
  end

  def book_restore
    return unless File.size(@path) != 2 && @books.empty?

    file = File.open(@path, 'r')
    loaded_books = JSON.parse(file.read)
    loaded_books.each do |book|
      bd = Book.new(book['title'], book['author'])
      @books.push(bd)
    end
  end

  def new_book(title, author)
    load_file = File.open(@path, 'r')
    loaded_books = JSON.parse(load_file.read)
    loaded_books << { 'title' => title, 'author' => author }
    File.write(@path, loaded_books.to_json)
  end
end
