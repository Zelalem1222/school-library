require_relative './app'


class App
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
          books_class.list_all_books
          exe
        when '2'
          list_all_people
        when '3'
            create_person
        when '4'
            books_class.create_book
            exe
        when '5'
          create_rental
        when '6'
          list_all_rentals
        else
          puts 'Thank You for using the app.'
          exit
        end
    end
end

def exe
    app = App.new
    app.run 
end

exe
    

    