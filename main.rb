# Requirements
# - Game class that holds the state of the game
#   - Score of capture pieces
#   - List of white and black pieces
#   - Players turns
#   - Check & Checkmate states
#   - Board State
# - One class per piece with its singularities
# - One `Piece` super class for all the the types of pieces
 #- Use [Chess Unicode symbols](https://en.wikipedia.org/wiki/Chess_symbols_in_Unicode) for display 

require './board.rb'
require './player.rb'
require './game.rb'


player1 = Player.new("Player 1", :white)
player2 = Player.new("Player 2", :black)
game = Game.new(player1, player2)

puts "Welcome to Ruby Chess! Type 'quit' at any time to exit."
game.play


