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
    @books = load_books
    @persons = load_persons
    @rentals = load_rentals
  end

  def list_books
    if @books.empty?
      puts 'No book to display. You can add one.'
    else
      @books.each { |book| puts(" | Title: #{book.title} Author: #{book.author} | ") }
    end
  end

  def save_data
    book_list = []
    rental_list = []
    persons_list = []
    unless Dir.exist?('memory')
      Dir.mkdir('memory')
    end
    @books.each do |book| 
      book_obj = {
        title: book.title,
        author: book.author
      }
      book_list << book_obj
    end
    File.write('./memory/books.json', JSON.pretty_generate(book_list))

    @rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        book: rental.book.title,
        person: rental.person.name
      }
      rental_list << rental_obj
    end
    File.write('./memory/rentals.json', JSON.pretty_generate(rental_list))

    @persons.each do |person|
      if person.class == Teacher
        persons_obj = {
          class_name: person.class,
          age: person.age,
          name: person.name,
          specialization: person.specialization
        }
      else
        persons_obj = {
          class_name: person.class,
          age: person.age,
          name: person.name,
          classroom: person.classroom,
          parent_permission: person.parent_permission
        }
      end
      persons_list << persons_obj
    end
    File.write('./memory/persons.json', JSON.pretty_generate(persons_list))
  end

  def load_books
    book_list = []
    if File.exist?('./memory/books.json')
      book_list = JSON.parse(File.read('./memory/books.json')).map do |book|
        Book.new(book['title'], book['author'])
      end
    end
    book_list
  end

  def load_persons
    persons_list = []
    if File.exist?('./memory/persons.json')
      persons_list = JSON.parse(File.read('./memory/persons.json')).map do |person|
        if person['class_name'] == 'Teacher'
          Teacher.new(person['age'], person['specialization'], person['name'])
        elsif person['class_name'] == 'Student'
          Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
        end
      end
    end
    persons_list
  end

  def load_rentals
    rental_list = []
    if @books.any? and @persons.any?
      if File.exist?('./memory/rentals.json')
        rental_list = JSON.parse(File.read('./memory/rentals.json')).map do |rental|
          bookObj = @books[0]
          personObj = @persons[0]
          @books.each do |book|
            if book.title == rental['book']
              bookObj = book
              break
            end
          end
          @persons.each do |person|
            if person.name == rental['person']
              personObj = person
              break
            end
          end
          Rental.new(rental['date'], bookObj, personObj)
        end
      end
      rental_list
    else
      rental_list
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
      new_rental = Rental.new(date.strftime('%m-%d-%y'), book, person)
      @rentals.push(new_rental)
      puts('Book has been rented successfully to the selected person')
    end
  end

  def list_of_rentals_person(id)
    person = @persons.select { |per| per.id == id }
    return 'No person found' if person.empty?

    person[0].view_rentals
  end
end
