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

  def filter(possible_moves)
    no_board_edges = filter_out_board_edges(possible_moves)
    no_blocked_locations = filter_out_blocked_locations(no_board_edges)
  end

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
    #possible moves
    # [[[6, 2], [5, 1], [4, 0]],
#      [[6, 3], [5, 3], [4, 3], [3, 3], [2, 3], [1, 3], [0, 3]],
#      [[6, 4], [5, 5], [4, 6], [3, 7]],
#      [[7, 2], [7, 1], [7, 0]],
#      [[7, 4], [7, 5], [7, 6], [7, 7]]]
    # block indices [[6, 2], [6, 3], [6, 4], [7, 2], [7, 4]]
    unblocked_stretches = []
    possible_moves.each do |stretch|
      blocking_indices.each do |blocking_index|
        unblocked_stretch = unblock_helper(stretch, blocking_index)
        unblocked_stretches << unblocked_stretch unless unblocked_stretch.nil?
      end
    end
    unblocked_stretches
  end

end
