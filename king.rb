require './piece'
class King < Piece
  def unicode
    color == :white ? '\u2654' : "\u265A"
  end
end
