class Flashcard
  attr_reader :definition
  attr_accessor :attempts

  def initialize(input = {})
    @answer = input.fetch(:answer) { "error"}
    @definition = input.fetch(:definition) {"Something went wrong. Guess 'error'."}
    @attempts = input.fetch(:attempts)
  end

  def is_correct?(input)
    input == @answer
  end

end


# card = Flashcard.new({answer: "John", definition: "A common first name."})
# puts card.definition
# puts card.is_correct?("John")
