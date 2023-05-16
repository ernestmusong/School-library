class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # This method inherits from the Nameable class
  def correct_name
    @name
  end
end

person = Person.new("John Doe")

decorator = Decorator.new(person)

puts decorator.correct_name
# => "John Doe"
