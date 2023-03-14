require_relative 'list_rentals'
require_relative 'add_person'

module RunMenu
  include AddPerson
  include ListRentals

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
end
