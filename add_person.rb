class AddPerson
  def initialize(app)
    @app = app
  end

  def add_person(app = @app)
    puts 'Enter 1 to create student or 2 to create teacher'
    option = gets.chomp.to_i
    case option
    when 1
      app.create_student
    when 2
      app.create_teacher
    else
      puts 'Invalid option'
    end
  end
end
