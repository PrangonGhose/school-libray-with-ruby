class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(age, name = 'Unknown', parent_permission: true)
    student = Student.new(age, self, name, parent_permission)
    @students.push(student)
  end
end
