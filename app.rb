require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  attr_reader :persons

  def initialize
    @books = []
    @rentals = []
    @persons = []
  end

  def list_books
    file = './memory/books_data.json'
    if JSON.parse(File.read(file))['books'].empty?
      puts 'No books to display. Please add one'
    else
      puts 'Saved Books:'
      data = File.read(file)
      books_data = JSON.parse(data)
      books = books_data['books']
      books.each do |book|
        puts "Title: #{book['title']} Author: #{book['author']}"
      end
    end
  end

  def list_all_people
    file = './memory/persons_data.json'
    if JSON.parse(File.read(file))['persons'].empty?
      puts 'No people to display. Please add one'
    else
      puts 'Registered people:'
      data = File.read(file)
      persons_data = JSON.parse(data)
      persons = persons_data['persons']
      persons.each do |person|
        if(person['class'] == 'TEACHER')
          puts "ID: #{person['id']}: #{person['class']} Name:#{person['name']} Age:#{person['age']} Spec:#{person['specialization']}"
        elsif(person['class'] == 'STUDENT')
          puts "ID: #{person['id']}: #{person['class']} Name:#{person['name']} Age:#{person['age']} Permission:#{person['parent_permission']}"
        end
      end
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
    new_student.save_student
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
    new_teacher.save_teacher
  end

  def create_book
    print('Enter Title of the book: ')
    title = gets.chomp
    print("Enter Author's Name: ")
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
    new_book.save_book
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
