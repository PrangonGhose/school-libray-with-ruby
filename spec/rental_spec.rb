require_relative '../rental'
require_relative '../book'
require_relative '../person_class'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(30, 'Jane Doe') }
  let(:rental) { Rental.new('2022-10-01', book, person) }

  describe '#initialize' do
    it 'creates a new instance of Rental with given date, book and person' do
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq('2022-10-01')
      expect(rental.book).to eql(book)
      expect(rental.person).to eql(person)
      expect(book.rentals.length).to eq(1)
      expect(book.rentals.first).to eql(rental)
      expect(person.rentals.length).to eq(1)
      expect(person.rentals.first).to eql(rental)
    end
  end
end