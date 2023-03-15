require_relative 'person_class'

class Teacher < Person
  attr_accessor :specialization

  # defining instance variable
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  # defining can_use_services? method
  def can_use_services?
    true
  end

  def save_teacher
    file = File.read('./memory/persons_data.json')
    data = JSON.parse(file)
    person_json = { age: @age, specialization: @specialization, name: @name, id: @id, class: 'TEACHER'}
    data['persons'] << person_json
    json = data.to_json
    File.write('./memory/persons_data.json', json)
  end
end
