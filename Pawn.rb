class Pawn < Piece
  MOVE_MODIFIERS = [0, 1]

  def possible_moves
    multiplier = 1
    multiplier = -1 if self.color == :white

    # this checks the forward
    possible_moves_array = []
    offending_tile = [(self.pos[0] + multiplier * 1),self.pos[1]]
    unless @board.find_piece(offending_tile)
      possible_moves_array << offending_tile
      clear = true
    end

    # this checks the left diagonal
    offending_tile = [(self.pos[0] + multiplier * 1), (self.pos[1] + multiplier * 1)]
    if @board.find_piece(offending_tile) && @board.find_piece(offending_tile).color != self.color
      possible_moves_array << offending_tile
    end

    # this checks the other diagonal
    offending_tile = [(self.pos[0] + multiplier * 1), (self.pos[1] - multiplier * 1)]
    if @board.find_piece(offending_tile) && @board.find_piece(offending_tile).color != self.color
      possible_moves_array << offending_tile
    end

    # this checks if the pawn hasn't been moved yet, and can move two spaces
    offending_tile = [(self.pos[0] + multiplier * 2),self.pos[1]]
    if !@board.find_piece(offending_tile) && (self.pos[0] == 1 || self.pos[0] == 6) && clear
      possible_moves_array << offending_tile
    end

    filter_out_board_edges(possible_moves_array)
  end
end