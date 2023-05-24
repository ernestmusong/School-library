require_relative 'decorator'

class TrimmerDecorator < Decorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.slice(0, 10)
  end
end
