class Piece

  attr_accessor :pos, :color
  attr_reader :move, :unicode

  def initialize(pos, color, unicode, board)
    @pos, @color, @unicode = pos, color, unicode
    @board = board

    puts "Ran into a nil for board" if @board.nil?
  end

  def possible_moves
    possible_moves = []
    pre_filtered_moves = self.class::MOVE_MODIFIERS.map do |move_modifier|
      possible_moves << [pos.first + move_modifier.first, pos.last + move_modifier.last]
    end
    filter(possible_moves)
  end

  def filter(possible_moves)
    no_board_edges = filter_out_board_edges(possible_moves)
    no_blocked_locations = filter_out_blocked_locations(no_board_edges)
  end

  def filter_out_board_edges(possible_moves)
    inbound_moves = possible_moves.select do |move|
      move.first.between?(0,7) && move.last.between?(0,7)
    end
    inbound_moves.delete([])
    inbound_moves
  end

  def filter_out_blocked_locations(possible_moves)
    blocking_locations = possible_moves.select do |move|
      piece_found = @board.find_piece(move)
      if piece_found
        piece_found.color == self.color
      else
        false
      end
    end

    possible_moves - blocking_locations
  end
end


## Generate a generic set of moves for each piece
# Make overall possible move list by adding current position
# Then filter board edges
# Then filter moves out after you run into a piece iff a sliding piece
# Cannot take friendly pieces
# Then filter moves that leave your king in check.

# This gives the valid moves for the piece