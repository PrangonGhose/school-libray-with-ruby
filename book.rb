class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.book = self
    rental.person.add_rentals(rentals) unless rental.person.rentals.include?(rental)
  end
end
