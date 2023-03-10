require_relative 'person_class'
require './student_class'
require './teacher_class'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name
puts capitalizedTrimmedPerson.correct_name