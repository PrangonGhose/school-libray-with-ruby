require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :persons

  def initialize
    @books = []
    @rentals = []
    @persons = []
  end

  def list_books
    if @books.empty?
      puts 'No book to display. You can add one.'
    else
      @books.each { |book| puts(" | Title: #{book.title} Author: #{book.author} | ") }
    end
  end

  def list_all_people
    if @persons.empty?
      puts 'No person to display. You can add one.'
    else
      @persons.each { |person| puts(" [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age} ") }
    end
  end

  def create_student
    print('Enter Name of the student: ')
    name = gets.chomp
    print('Enter Age of the student: ')
    age = gets.chomp
    print('Has parent permission [Y/N]? ')
    parent_permission = gets.chomp
    parent_permission = parent_permission != ('n' || 'N')
    new_student = Student.new(age, nil, name, parent_permission)
    @persons.push(new_student)
    puts 'Student created successfully'
  end

  def create_teacher
    print('Enter Name of the teacher: ')
    name = gets.chomp
    print('Enter Age of the teacher: ')
    age = gets.chomp
    print("Enter teacher's specialization: ")
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    @persons.push(new_teacher)
    puts 'Teacher created successfully'
  end

  def create_book
    print('Enter Title of the book: ')
    title = gets.chomp
    print("Enter Author's Name: ")
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty? or @persons.empty?
      puts 'You need to create at least one person and one book to rent.'
    else
      puts 'Select a person from the list by number'
      @persons.each_with_index do |person, i|
        puts(" #{i} Name: #{person.name} Age: #{person.age}")
      end
      index = gets.chomp.to_i
      person = @persons[index]
      puts 'Select a book from the list by number'
      @books.each_with_index do |book, i|
        puts(" #{i} Title: #{book.title} Author: #{book.author}")
      end
      index = gets.chomp.to_i
      book = @books[index]
      date = Time.new
      Rental.new(date.strftime('%m-%d-%y'), book, person)
      puts('Book has been rented successfully to the selected person')
    end
  end

  def list_of_rentals_person(id)
    person = @persons.select { |per| per.id == id }
    return 'No person found' if person.empty?

    person[0].view_rentals
  end
end
