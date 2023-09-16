require './piece'
class Bishop < Piece
  def unicode
    color == :white ? "\u2657" : "\u265D"
  end
end
