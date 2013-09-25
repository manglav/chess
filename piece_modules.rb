module SlidingPiece

  def self.make_move_modifiers(move_directions)
    result = []
    (1..7).each do |num|
      result << move_directions.map { |dir| [num * dir[0], num * dir[1]]}
    end
    result.transpose
  end

  def possible_moves
    possible_moves = []
    pre_filtered_moves = self.class::MOVE_MODIFIERS.map do |move_modifier|
      possible_moves << move_modifier.map do |move|
        [pos.first + move.first, pos.last + move.last]
      end
    end

    filter(possible_moves)
  end

  # filter(possible_moves) is in Piece.rb

  def filter_out_board_edges(possible_moves)
    inbound_moves = possible_moves.map do |move_stretch|
      move_stretch.select do |move|
        move.first.between?(0,7) && move.last.between?(0,7)
      end
    end

    inbound_moves.delete([])
    inbound_moves
  end

  def blocking_locations(possible_moves)
    blocking_locations = possible_moves.map do |move_stretch|
      move_stretch.detect do |move|
        @board.piece_locations.include?(move)
      end
    end
  end

  def unblock_helper(stretch, blocking_index)
    if stretch.include?(blocking_index)
      stretch_block_index = stretch.index(blocking_index)
      stretch_block_index -= 1 if @board.find_piece(blocking_index).color == self.color

      stretch[0..stretch_block_index] unless stretch_block_index == -1
    end
  end

  def filter_out_blocked_locations(possible_moves)
    blocking_indices = blocking_locations(possible_moves)
    unblocked_stretches = []
    possible_moves.each do |stretch|
      blocking_indices.each do |blocking_index|
        unblocked_stretch = unblock_helper(stretch, blocking_index)
        unblocked_stretches << unblocked_stretch unless unblocked_stretch.nil?
      end
    end
    unblocked_stretches.flatten(1)
  end

end
