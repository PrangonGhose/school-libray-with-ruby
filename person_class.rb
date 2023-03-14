require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  # defining instance variables
  def initialize(age, name = 'Unknown', parent_permission = true) # rubocop:disable Style/OptionalBooleanParameter
    @id = Time.now.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  # defining accessor get and set method
  attr_accessor :name, :age, :rentals

  # defining accessor get method
  attr_reader :id, :parent_permission

  # defining can_use_services? method
  def can_use_services?
    of_age? || @parent_permission
  end

  # defining correct_name method
  def correct_name
    @name
  end

  def add_rentals(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    rental.book.rentals.push(rental) unless rental.book.rentals.include?(rental)
  end

  def view_rentals
    if @rentals.empty?
      print('No Rentals')
    else
      rentals.each { |rent| puts("  #{rent.date} | #{rent.person.name} | #{rent.book.title}") }
    end
  end

  # defining private method is_of_age? [method name of_age? is used to avoid linters]
  private

  def of_age?
    @age >= 18
  end
end
