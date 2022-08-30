# frozen_string_literal: true

class Person
  def initialize(age, parent_permission: true , name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  private :is_of_age?
  public :can_use_services?
  attr_reader :id
  attr_accessor :name, :age
end
