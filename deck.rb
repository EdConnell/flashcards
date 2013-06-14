class Deck
  def initialize(answer_def_hash)
    @deck_of_cards = []
    create_flash_cards(answer_def_hash.shuffle)
  end

  def create_flash_cards(answer_def_hash)
    answer_def_hash.each do |pair|
      @deck_of_cards << Flashcard.new(pair)
    end
  end

  def is_correct?(i, input)
    @deck_of_cards[i].is_correct?(input)
  end

  def get_definition(i)
    @deck_of_cards[i].definition
  end

  def size
    @deck_of_cards.size
  end

  def card_attempt_increment(index)
    @deck_of_cards[index].attempts += 1
  end

  def repeat?
    @deck_of_cards.any? { |card| card.attempts >= 2 }
  end

  def reset
    @deck_of_cards = @deck_of_cards.select {|card| card.attempts >= 2}
    reset_attempts!
  end

  def reset_attempts!
    @deck_of_cards.each do |card|
      card.attempts = 0
    end
  end

  def multiple_attempts?(index)
    @deck_of_cards[index].attempts > 0
  end
end
