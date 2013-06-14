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

  def start
    @deck.size.times do |index|
      puts @deck.get_definition(index)
      until @deck.is_correct?(index, input)
        input = gets.chomp
      end
    end
  end

end
