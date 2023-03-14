require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental.person.rentals.push(rental) unless rental.person.rentals.include?(rental)
  end
end
