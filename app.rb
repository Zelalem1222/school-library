require_relative "./person.rb"
require_relative "./rental.rb"
require_relative "./student.rb"
require_relative "./teacher.rb"
require_relative "./book.rb"

class App
 attr_reader :people , :books , :rentals

    def initialize
        @people = []
        @books = []
        @rentals = []
    end

    def options
        puts "Please choose an option by enterin a number :"
        puts "1 - List all books"
        puts "2 - List all people"
        puts "3 - Create a person"
        puts "4 - Create a book"
        puts "5 - Create a rental"
        puts "6 - List all rentals for a given person id"
        puts "7 - Exit\n\n"
        gets.chomp
    end

    def run
        choose = options
        case choose
        when "1"
            list_all_books
        when "2"
            list_all_people
        when "3"
            create_person
        when "4"
            create_book
        when "5"
            create_rental
        when "6"
            list_all_rentals
        else 
            exit
        end 
    end


    def list_all_books
          if @books.size.positive?
            puts "Here are the books registered :"
            @books.each_with_index { | book , index | puts "#{index}- Title: \"#{book.title}\" , Author: #{book.author} " }
          else 
            puts "Sorry No book registered. Try after you adding a book"
          end
         gets.chomp
         run
    end

    def create_book
        print "Title: "
        title = gets.chomp()
        print "Author: "
        author = gets.chomp()
        book = Book.new(title , author)
        @books.push(book)
        puts "Book created successfully"
        run
    end


end




