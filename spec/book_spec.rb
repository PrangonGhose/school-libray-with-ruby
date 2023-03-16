require 'rspec'
require_relative '../book'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { double('Person', rentals: []) }

  describe '#initialize' do
    it 'creates a new book with a title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rentals' do
    it 'adds a new rental to the book\'s rentals array' do
      rental = double('Rental', person: person)
      allow(Rental).to receive(:new).and_return(rental)

      book.add_rentals('2023-03-03', person)
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person\'s rentals array' do
      rental = double('Rental', person: person)
      allow(Rental).to receive(:new).and_return(rental)

      book.add_rentals('2023-03-03', person)
      expect(person.rentals).to include(rental)
    end
  end
end 