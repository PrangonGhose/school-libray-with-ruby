class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def rent(book, person)
    @book = book
    book.add_rentals(self) unless book.rentals.include?(self)
    @person = person
    person.add_rentals(self) unless person.rentals.include?(self)
  end
end
