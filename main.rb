#!/usr/bin/env ruby
require 'colorize'
require_relative './instructions'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require 'pry'
class App
  include Instructions

  def bold
    "\e[1m#{self}\e[22m"
  end

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_objects(input)
    case input
    when 1
      list_books
    when 2
      list_people
    when 6
      list_rentals
    end
  end

  def create_object(input)
    case input
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    end
  end

  def list_books
    puts(@books.map { |b| "Title: #{b.title}, Author: #{b.author}" })
  end

  def list_people
    puts(@people.map { |p| "[#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" })
  end

  def create_person
    selection = one_line_prompt('Do you want to create a student (1) or a teacher (2)? [input the number]: ').to_i

    unless [1, 2].include?(selection)
      puts 'ERROR: Invalid option. Select 1 or 2'
      return
    end

    age = one_line_prompt('Age: ').to_i
    name = one_line_prompt('Name: ')

    case selection
    when 1
      input = one_line_prompt('Has parent permission? [Yes/No]: ')
      permission = %w[Yes yes YES].include?(input)
      @people.push(Student.new(age, name, parent_permission: permission))
      puts 'PERSON CREATED SUCCESSFULLY'.green
    when 2
      specialization = one_line_prompt('Specialization: ')
      @people.push(Teacher.new(age, specialization, name))
      puts 'PERSON CREATED SUCCESSFULLY'.green
    end
  end

  def create_book
    title = one_line_prompt('Title: ')
    author = one_line_prompt('Author: ')
    @books.push(Book.new(title, author))
    puts 'BOOK CREATED SUCCESSFULLY'.green
  end

  def create_rental
    puts 'Select a book from the following list by number'
    puts(@books.each_with_index.map { |b, i| "#{i + 1}) Title: #{b.title}, Author: #{b.author}" })
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    puts(@people.each_with_index.map do |p, i|
           "#{i + 1}) [#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
         end)
    person_index = gets.chomp.to_i

    date = one_line_prompt('Date [YYYY/MM/DD]: ')
    @rentals.push(Rental.new(date, @people[person_index - 1], @books[book_index - 1]))
    puts 'RENTAL CREATED SUCCESSFULLY'.yellow
  end

  def list_rentals
    id = one_line_prompt('ID of person: ').to_i
    person = @people.filter { |p| p.id == id }.first
    puts 'Rentals:'
    puts(person.rentals.map { |r| "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" })
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

def main
  app = App.new
  app.run
end

main
