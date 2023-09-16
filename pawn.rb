require './piece.rb'
class Pawn < Piece
  
  def unicode 
    color == :white ? "\u2659" : "\u265F"
  end 
end