require_relative '../person_class'
require_relative '../book'
require_relative '../rental'

describe Person do
  let(:person) { Person.new(20, 'John Doe') }

  describe '#initialize' do
    it 'creates a new instance of Person with given age and name' do
      expect(person).to be_an_instance_of(Person)
      expect(person.age).to eq(20)
      expect(person.name).to eq('John Doe')
    end

    it 'sets parent_permission to true by default' do
      expect(person.parent_permission).to be true
    end

    it 'sets rentals to an empty array by default' do
      expect(person.rentals).to eq([])
    end

    it 'sets id to current time in integer format' do
      expect(person.id).to be_an(Integer)
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when person is not of age but has parent permission' do
      let(:person) { Person.new(16, 'Jane Doe', true) }

      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when person is not of age and does not have parent permission' do
      let(:person) { Person.new(16, 'Jane Doe', false) }

      it 'returns false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#correct_name' do
    it "returns the person's name" do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#add_rentals' do
    let(:book) { double('book', rentals: []) }

    before(:each) { person.add_rentals('2022-10-01', book) }

    it "adds a new rental to the person's rentals" do
      expect(person.rentals.length).to eq(2)
      rental = person.rentals.first
      expect(rental.date).to eq('2022-10-01')
      expect(rental.book).to eql(book)
      expect(rental.person).to eql(person)
    end

    it "adds the rental to the book's rentals" do
      rental = book.rentals.first
      expect(book.rentals.length).to eq(1)
      expect(rental.date).to eq('2022-10-01')
      expect(rental.book).to eql(book)
      expect(rental.person).to eql(person)
    end
  end

  describe '#view_rentals' do
    let(:person) { Person.new(20, 'John') }
    let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
    let(:rental) { Rental.new('2023-03-03', book, person) }

    describe '#view_rentals' do
      context 'when person has no rentals' do
        it 'prints "No Rentals"' do
          expect { person.view_rentals }.to output('No Rentals').to_stdout
        end
      end

      context 'when person has rentals' do
        before do
          person.add_rentals(rental, book)
        end

        it 'prints rental details' do
          expect do
            person.view_rentals
          end.to output("  2023-03-03 | John | The Great Gatsby\n  #{rental} | John | The Great Gatsby\n  #{rental} | John | The Great Gatsby\n").to_stdout # rubocop:disable Layout/LineLength
        end
      end
    end
  end
end
