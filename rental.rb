require_relative 'book'
require_relative 'person'

class Rental
    attr_accessor :date
    attr_reader :book, :person

    def initialize(date, book, person)
        @date = date

        @book = book
        book.rented_out_to << self
  
      @person = person
      person.book_rented << self
    end
end