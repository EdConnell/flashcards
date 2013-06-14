class Game
  attr_reader :deck

  def text_parser(filename)
    File.read(filename).scan(/(.*\..?)\n(.*)/)
  end

  def create_deck(filename)
    flashcard_hashes = []
    text_parser(filename).each do |line|
      flashcard_hashes << {:definition => line[0], :answer => line[1]}
      @deck = Deck.new(flashcard_hashes)
    end
  end

  def play
    (@deck.size).times do |index|
      puts @deck.get_definition(index)
      input = gets.chomp
      until @deck.is_correct?(index, input)
        puts "Incorrect. Guess again."
        input = gets.chomp
      end
      puts "Correct."
    end
  end

end
