class Piece

  attr_accessor :pos, :color
  attr_reader :move, :unicode

  def initialize(pos, color, unicode, board)
    @pos, @color, @unicode = pos, color, unicode
    @board = board

    puts "Ran into a nil for board" if @board.nil?
  end

  # assume each piece has a moves instance variable
  # Queen => move = []
  def possible_moves ######### different
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

  def filter_out_board_edges(possible_moves) ## different
    inbound_moves = possible_moves.select do |move|
      move.first.between?(0,7) && move.last.between?(0,7)
    end
    inbound_moves.delete([])
    inbound_moves
  end

  def filter_out_blocked_locations(possible_moves) #changed
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

  # def filter_out_blocked_locations(possible_moves) ## different
#     p "filter blocked locations"
#     blocking_indices = blocking_locations(possible_moves)
#     p blocking_indices
#     #possible moves
#     # [[[6, 2], [5, 1], [4, 0]],
# #      [[6, 3], [5, 3], [4, 3], [3, 3], [2, 3], [1, 3], [0, 3]],
# #      [[6, 4], [5, 5], [4, 6], [3, 7]],
# #      [[7, 2], [7, 1], [7, 0]],
# #      [[7, 4], [7, 5], [7, 6], [7, 7]]]
#     # block indices [[6, 2], [6, 3], [6, 4], [7, 2], [7, 4]]
#     unblocked_stretches = []
#     p "possible moves"
#     p possible_moves
#     possible_moves.each do |stretch|
#       blocking_indices.each do |blocking_index|
#         unblocked_stretch = unblock_helper(stretch, blocking_index)
#         unblocked_stretches << unblocked_stretch unless unblocked_stretch.nil?
#       end
#     end
#     unblocked_stretches
#   end

end


## Generate a generic set of moves for each piece
# Make overall possible move list by adding current position
# Then filter board edges
# Then filter moves out after you run into a piece iff a sliding piece
# Cannot take friendly pieces
# Then filter moves that leave your king in check.

# This gives the valid moves for the piece