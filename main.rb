require_relative 'app'

def menu
  puts "\n-----------------------------------\nPick an option by entering a number:"
  print("
  1 - List all books
  2 - List all people
  3 - Add a book
  4 - Add a person
  5 - Rent a book
  6 - List rents of a person
  0 - Exit
  ")
end

def add_person(app)
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

def list_rentals_per_person_id(app)
  if app.persons.length.positive?
    print('Choose a person by entering his ID to see his rentals: ')
    app.persons.each { |person| puts(" [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age} ") }
    id = gets.chomp.to_i
    return app.list_of_rentals_person(id) if id >= 0
  else
    puts 'No person to display. You can add one.'
  end
end

def run_menu(app, option)
  case option
  when 1
    app.list_books
  when 2
    app.list_all_people
  when 3
    app.create_book
  when 4
    add_person(app)
  when 5
    app.create_rental
  when 6
    list_rentals_per_person_id(app)
  else
    puts 'Invalid option. Enter a valid number.'
  end
end

def main
  option = -1
  app = App.new
  until option.zero?
    menu
    option = gets.chomp.to_i
    puts ''
    run_menu(app, option) unless option.zero?
  end
  puts 'Thank you for using this app'
end

main
