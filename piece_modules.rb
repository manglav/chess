module SlidingPiece

  def self.make_move_modifiers(move_directions)
    result = []
    (1..7).each do |num|
      result << move_directions.map { |dir| [num * dir[0], num * dir[1]]}
    end
    result.transpose
  end

end
