class Knight < Piece
  def self.make_move_modifiers
    [1, -1, -2, 2].permutation(2).to_a.select do |arr|
      arr[0] * -1 != arr[1]
    end
  end

  MOVE_MODIFIERS = make_move_modifiers
end