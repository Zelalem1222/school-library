# frozen_string_literal: true

require_relative './person'

class Student < Person
  def initialize( age, parent_permission, classroom ,name = 'Unknown')
    super(age, parent_permission: parent_permission , name)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end

s1 = Student.new(21, true, 'ddcd')
s1.play_hooky
