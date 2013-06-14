require_relative 'game.rb'
require_relative 'deck.rb'
require_relative 'flashcard.rb'

game = Game.new
game.create_deck('flashcard_samples.txt')
game.play
