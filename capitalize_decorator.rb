require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super(@nameable)
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
