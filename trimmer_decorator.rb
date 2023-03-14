require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super(@nameable)
  end

  def correct_name
    @nameable.correct_name[0..10]
  end
end
