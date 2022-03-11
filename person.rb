require_relative 'corrector'

class Person
  attr_accessor :name, :age

  attr_reader :id, :rentals

  # rubocop:disable Style/ClassVars

  @@id = 1

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = @@id
    @@id += 1
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  # rubocop:enable Style/ClassVars

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    age >= 18
  end
end
