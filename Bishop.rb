

class Bishop < Piece
  include SlidingPiece
  MOVE_DIRECTIONS = [[-1,1], [-1,-1], [1,-1], [1,1]]
  MOVE_MODIFIERS = SlidingPiece::make_move_modifiers(MOVE_DIRECTIONS)
end