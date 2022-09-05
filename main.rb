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
  # rubocop:disable Metrics/MethodLength

  def run
    choose = options
    case choose
    when '1'
      books_class.list_all_books
      exe
    when '2'
      people_class.list_all_people
      exe
    when '3'
      people_class.create_person
      exe
    when '4'
      books_class.create_book
      exe
    when '5'
      rentals.create_rental
      exe
    when '6'
      rentals.list_all_rentals
      exe
    else
      puts 'Thank You for using the app.'
      exit
    end
  end
end
# rubocop:enable Metrics/MethodLength

def exe
  app = App.new
  app.run
end

exe
