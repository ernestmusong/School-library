require 'securerandom'
require_relative 'nameable'
require_relative '../decorators/capitalize_decorator'
require_relative '../decorators/trimer_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(name: 'Unknown', age: 0, parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end

person = Person.new(name: 'maximttttttttt', age: 22)
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
