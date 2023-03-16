require 'rspec'
require_relative '../classroom'
require_relative '../student_class'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }

  describe '#initialize' do
    it 'creates a new classroom with a label' do
      expect(classroom.label).to eq('Math')
    end

    it 'initializes students as an empty array' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a new student to the classroom\'s students array' do
      student = double('Student')
      allow(Student).to receive(:new).and_return(student)

      classroom.add_student(18)
      expect(classroom.students).to include(student)
    end

    it 'creates a new student with the given age and name' do
      student = double('Student')
      allow(Student).to receive(:new).and_return(student)

      classroom.add_student(18, 'John Doe')
      expect(Student).to have_received(:new).with(18, classroom, 'John Doe', true)
    end

    it 'creates a new student with the given age and parent permission' do
      student = double('Student')
      allow(Student).to receive(:new).and_return(student)

      classroom.add_student(18, parent_permission: false)
      expect(Student).to have_received(:new).with(18, classroom, 'Unknown', false)
    end
  end
end
