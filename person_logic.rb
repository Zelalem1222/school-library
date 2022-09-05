require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './data_values'

class PersonLogic
  include Data

  attr_accessor :people

  def initialize
    @people = Data.peoples
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
end
