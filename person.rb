class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  private :of_age?
  public :can_use_services?
  attr_reader :id
  attr_accessor :name, :age
end
