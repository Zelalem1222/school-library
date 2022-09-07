require_relative './person'

class Teacher < Person
  def initialize(age, name, specialization, id)
    super(age, name, id)
    @specialization = specialization
    @class = 'Teacher'
  end

  def can_use_services
    true
  end
end
