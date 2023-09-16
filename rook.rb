class Rook < Piece
  def unicode
    color == :white ? "\u2656" : "\u265C"
  end
end
