require_relative 'person_class'
require 'json'

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

  def save_student
    file = File.read('./memory/persons_data.json')
    data = JSON.parse(file)
    person_json = { age: @age, classroom: @classroom, name: @name, parent_permission: @parent_permission, id: @id, class: 'STUDENT'}
    data['persons'] << person_json
    json = data.to_json
    File.write('./memory/persons_data.json', json)
  end
end
