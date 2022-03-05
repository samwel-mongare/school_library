module Instructions
  def main_prompt
    puts <<~HEREDOC
      Please choose an option by entering a number:
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person
      7 - Exit
    HEREDOC
    gets.chomp.to_i
  end

  def one_line_prompt(message)
    print message
    gets.chomp
  end
end
