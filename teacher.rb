# frozen_string_literal: true

require_relative './person'

class Teacher < Person
  def initialize(age, parent_permission, specialization ,name = 'Unknown')
    super( age, parent_permission: parent_permission, name) 
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

t1 = Teacher.new(21, true, 'jsc')
p t1
