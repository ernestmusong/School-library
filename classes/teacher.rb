require_relative 'nameable'
class Teacher < Person
  attr_reader :specialization

  def initialize(name: 'Unknown', age: 0, parent_permission: true, specialization: '')
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
