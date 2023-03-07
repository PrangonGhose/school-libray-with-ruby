require_relative './person_class'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # defining play_hooky method
  def play_hooky
    '¯\(ツ)/¯'
  end
end
