require_relative 'list_rentals'
require_relative 'add_person'

class RunMenu
  def initialize(app, option)
    @app = app
    @option = option
  end

  def run_menu(app = @app, option = @option)
    case option
    when 1
      app.list_books
    when 2
      app.list_all_people
    when 3
      app.create_book
    when 4
      AddPerson.new(app).add_person
    when 5
      app.create_rental
    when 6
      ListRentals.new(app).list_rentals_per_person_id
    else
      puts 'Invalid option. Enter a valid number.'
    end
  end
end
