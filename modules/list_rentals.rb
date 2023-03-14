module ListRentals
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
end
