require_relative 'game.rb'
require_relative 'deck.rb'
require_relative 'flashcard.rb'

if ARGV.any?
  file = ARGV[0].strip
else
  file = "flashcard_samples.txt"
end

game = Game.new
game.create_deck(file)
game.play
