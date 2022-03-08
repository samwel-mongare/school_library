require_relative 'person_display'
require_relative 'books_display'
require_relative 'rentals_display'

class App
  include Instructions
  def bold
    "\e[1m#{self}\e[22m"
  end

  def initialize
    @book = BooksDisplay.new
    @person = PersonDisplay.new
    @rental = RentalDisplay.new(@book, @person)
  end

  def list_objects(input)
    case input
    when 1
      @book.list_books
    when 2
      @person.list_people
    when 6
      @rental.list_rentals
    end
  end

  def create_object(input)
    case input
    when 3
      @person.create_person
    when 4
      @book.create_book
    when 5
      @rental.create_rental
    end
  end

  def run
    puts 'Welcome to OOP School Library'.bold
    loop do
      input = main_prompt
      list_objects(input) if [1, 2, 6].include?(input)
      create_object(input) if [3, 4, 5].include?(input)
      if input == 7
        puts 'Thank you for using this app'.yellow
        break
      end
    end
  end
end
