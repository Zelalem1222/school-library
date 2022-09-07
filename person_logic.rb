require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './data_values'
require_relative './data_init'
require 'json'

class PersonLogic
  include Data

  attr_accessor :people

  def initialize
    @people = Data.peoples
    @data_init = DataInit.new
  end

  def list_all_people
    load_persons
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
    load_persons
    case person_class
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts 'Person created successfully'
    gets
  end

  def load_persons
    File.exist?('./store/people.json') ? @data_init.people_restore : @data_init.people_init
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
    gets.chomp
    print 'ID:  '
    id = gets.chomp.to_i
    person = Student.new(age, name, nil, id)
    @data_init.new_student(age, name, id)
    @people.push(person)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    print 'ID:  '
    id = gets.chomp.to_i
    teacher = Teacher.new(age, name, specialization, id)
    @data_init.new_teacher(age, name, specialization, id)
    @people.push(teacher)
  end
end
