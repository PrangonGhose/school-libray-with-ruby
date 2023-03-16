require_relative '../teacher_class'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Mathematics', 'Jane Doe') }

  describe '#initialize' do
    it 'creates a new instance of Teacher with given age, specialization and name' do
      expect(teacher).to be_an_instance_of(Teacher)
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Mathematics')
      expect(teacher.name).to eq('Jane Doe')
    end

    it 'sets rentals to an empty array by default' do
      expect(teacher.rentals).to eq([])
    end

    it 'sets id to current time in integer format' do
      expect(teacher.id).to be_an(Integer)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
