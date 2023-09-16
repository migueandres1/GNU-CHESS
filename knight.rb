require './piece.rb'

class Knight < Piece
  def unicode
    if color == :white
      "\u2658"
    else
      "\u265E"
    end
  end
end

