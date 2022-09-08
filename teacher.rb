require_relative './person'

class Teacher < Person

  attr_accessor :specialization
  
  def initialize(age, name, specialization, id)
    @specialization = specialization
    @class = 'Teacher'
    super(age, name, id)
  end

  def can_use_services
    true
  end
end
