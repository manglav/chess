class King < Piece
  def self.make_move_modifiers
    a = [-1, 0 ,1].repeated_permutation(2).to_a
    a.delete([0,0])
    a
  end
  MOVE_MODIFIERS = make_move_modifiers

end