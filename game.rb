class Game
  attr_reader :deck

  def text_parser(filename)
    File.read(filename).scan(/(.*\..?)\n(.*)/)
  end

  def create_deck(filename)
    flashcard_hashes = []
    text_parser(filename).each do |line|
      flashcard_hashes << {:definition => line[0], :answer => line[1], :attempts => 0}
      @deck = Deck.new(flashcard_hashes)
    end
  end

  def play
    (@deck.size).times do |index|
      puts @deck.get_definition(index) unless multiple_attempts?(index)
      input = get_user_input
      if @deck.is_correct?(index, input)
        puts "Correct."
        next
      else
        @deck.card_attempt_increment(index)
        puts "Incorrect. Guess again."
        redo
      end
    end

    if @deck.need_to_repeat?
      puts "Great job.  Let's repeat the cards with which you struggled the most."
      reset_deck_with_missed_cards
      play
    end
    puts "You've finished all the cards in under two attempts!"
  end

  def get_user_input
    STDIN.gets.chomp
  end

  def multiple_attempts?(index)
    @deck.multiple_attempts?(index)
  end

  def reset_deck_with_missed_cards
    @deck.reset
  end

end
