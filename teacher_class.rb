require_relative 'person_class'

class Teacher < Person
  # defining instance variable
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  # defining can_use_services? method
  def can_use_services?
    true
  end
end
