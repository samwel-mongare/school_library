class Book
	attr_accessor :title, :author
	attr_reader :rented_out_to

	def initialize(title, author)
		@title = title
		@author = author
		@rented_out_to = []
	end
end