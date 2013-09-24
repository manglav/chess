class Piece

  attr_accessor :pos, :color
  attr_reader :move, :unicode

  def initialize(pos, color, unicode)
    @pos, @color, @unicode = pos, color, unicode
  end

  # assume each piece has a moves instance variable
  # Queen => move = []
  def possible_moves


  end

end

## Generate a generic set of moves for each piece
# Make overall possible move list by adding current position
# Then filter board edges
# Then filter moves out after you run into a piece iff a sliding piece
# Then filter moves that leave your king in check.

# This gives the valid moves for the piece