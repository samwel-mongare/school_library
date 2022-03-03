class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name
  attr_reader :age, :parent_permission

  def can_use_services?
    if of_age? || parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    age >= 18
  end
end
