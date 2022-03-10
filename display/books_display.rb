require 'pry'
require 'json'

class BooksDisplay
  include Instructions

  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    title = one_line_prompt('Title: ')
    author = one_line_prompt('Author: ')
    @books.push(Book.new(title, author))
    # binding.pry
    f = File.new("./data/books.json", "w")
    jjn = @books.map { |b| {Title: b.title, Author: b.author} }
    f.puts(JSON.pretty_generate(jjn))
    f.close
    puts 'BOOK CREATED SUCCESSFULLY'.green
  end

  def list_books
    if @books.length.positive?
      puts(@books.map { |b| "Title: #{b.title}, Author: #{b.author}" })
    else
      puts 'No books added yet!'.red
    end
  end

  def load_books
    if File.exist?('./data/books.json')
    file = File.read('./data/books.json')
    data_hash = JSON.parse(file)
    # binding.pry
    data_hash.map do |book|
      @books.push(Book.new(book['Title'], book['Author']))
      
    end
else
      puts 'No books added yet!'.red
    end
  end
end
