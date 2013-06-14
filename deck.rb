#require_relative 'flashcard.rb'

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
end
