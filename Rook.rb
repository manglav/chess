class Rook < Piece
  include SlidingPiece

  MOVE_DIRECTIONS = [[-1, 0], [0, -1], [0, 1], [1, 0]]
  MOVE_MODIFIERS = SlidingPiece::make_move_modifiers(MOVE_DIRECTIONS)
end