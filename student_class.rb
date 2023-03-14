require_relative 'person_class'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission = true) # rubocop:disable Style/OptionalBooleanParameter
    super(age, name, parent_permission)
    @classroom = classroom

    # As no classroom method is created in app.rb, the next line is commented
    # classroom.students << self
  end

  # defining play_hooky method
  def play_hooky
    '¯\(ツ)/¯'
  end
end
