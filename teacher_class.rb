require_relative './person_class'

class Teacher < Person
  # defining instance variable
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # defining can_use_services? method
  def can_use_services?
    true
  end
end
