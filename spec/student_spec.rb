require_relative '../student_class'

describe Student do
  let(:student) { Student.new(20, 'Classroom 1', 'John Doe') }

  describe '#initialize' do
    it 'creates a new instance of Student with given age, classroom and name' do
      expect(student).to be_an_instance_of(Student)
      expect(student.age).to eq(20)
      expect(student.classroom).to eq('Classroom 1')
      expect(student.name).to eq('John Doe')
    end

    it 'sets parent_permission to true by default' do
      expect(student.parent_permission).to be true
    end

    it 'sets rentals to an empty array by default' do
      expect(student.rentals).to eq([])
    end

    it 'sets id to current time in integer format' do
      expect(student.id).to be_an(Integer)
    end
  end

  describe '#play_hooky' do
    it 'returns the string ¯(ツ)/¯' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
