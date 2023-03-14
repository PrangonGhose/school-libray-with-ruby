require_relative 'app'
require_relative 'run_menu'

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

def main
  option = -1
  app = App.new
  until option.zero?
    menu
    option = gets.chomp.to_i
    puts ''
    RunMenu.new(app, option).run_menu unless option.zero?
  end
  puts 'Thank you for using this app'
end

main
