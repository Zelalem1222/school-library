require_relative './person'

class Student < Person
  def initialize(age, parent_permission, classroom, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
