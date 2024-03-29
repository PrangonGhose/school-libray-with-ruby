require_relative 'app'
require_relative './modules/run_menu'

class Main
  include RunMenu

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
      run_menu(app, option) unless option.zero?
    end
    app.save_data
    puts 'Thank you for using this app'
  end
end

Main.new.main
