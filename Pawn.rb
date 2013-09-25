class Pawn < Piece
  MOVE_MODIFIERS = [0, 1]

  def possible_moves
    multiplier = 1
    multiplier = -1 if self.color == :black

    possible_moves_array = []
    offending_tile = [(self.pos[0] + multiplier * 1),self.pos[1]]
    unless @board.find_piece(offending_tile)
      possible_moves_array << offending_tile
    end

    offending_tile = [(self.pos[0] + multiplier * 1), (self.pos[1] + multiplier * 1)]
    if @board.find_piece(offending_tile) && @board.find_piece(offending_tile).color != self.color
      possible_moves_array << offending_tile
    end

    offending_tile = [(self.pos[0] + multiplier * 1), (self.pos[1] - multiplier * 1)]
    if @board.find_piece(offending_tile) && @board.find_piece(offending_tile).color != self.color
      possible_moves_array << offending_tile
    end

    possible_moves_array
  end
end