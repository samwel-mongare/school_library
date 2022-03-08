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
        puts 'BOOK CREATED SUCCESSFULLY'.green
      end

      def list_books
        if @books.length > 0
            puts(@books.map { |b| "Title: #{b.title}, Author: #{b.author}" })
              else
            puts "No books added yet!".red
              end
      end
end