require_relative 'nameable'

class Person < Nameable
  # defining instance variables
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  # defining accessor get and set method
  attr_accessor :name, :age

  # defining accessor get method
  attr_reader :id

  # defining can_use_services? method
  def can_use_services?
    of_age? || @parent_permission
  end

  # defining correct_name method
  def correct_name
    @name
  end

  # defining private method is_of_age? [method name of_age? is used to avoid linters]
  private

  def of_age?
    @age >= 18
  end
end
