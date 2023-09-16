require './piece'
class Queen < Piece

  def unicode 
    color == :white ? "\u2655" : "\u265B"
  end 
end 
