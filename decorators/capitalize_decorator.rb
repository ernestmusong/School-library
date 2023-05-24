require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.capitalize
  end
end
