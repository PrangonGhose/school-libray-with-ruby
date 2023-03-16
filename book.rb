require_relative 'rental'
require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    rental.person.rentals.push(rental) unless rental.person.rentals.include?(rental)
  end

  def save_book
    file = File.read('./memory/books_data.json')
    data = JSON.parse(file)
    book_json = { title: @title, author: @author }
    data['books'] << book_json
    json = data.to_json
    File.write('./memory/books_data.json', json)
  end
end
