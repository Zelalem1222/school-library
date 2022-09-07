require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom, id)
    super(age, name, id)
    @classroom = classroom
    @class = 'Student'
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
