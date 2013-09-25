class Board
  attr_reader :pieces

  def initialize
    @pieces = []

    create_pieces
  end

  def make_move(start_pos, end_pos)
    moving_piece = @pieces.select { |piece| piece.pos == start_pos }
    piece_at_dest = @pieces.select { |piece| piece.pos == end_pos }

    @pieces.delete(piece_at_dest) if piece_at_dest

    moving_piece.pos = end_pos
  end

  def piece_locations
    @pieces.map { |piece| piece.pos }
  end

  def find_piece(index)
    piece = @pieces.select { |piece| piece.pos == index }[0]
    return nil unless piece
    piece
  end

  def create_pieces
    # Black Pieces
    8.times do |index|
      @pieces << Pawn.new([6, index], :black, "\u265F", self)
    end

    @pieces << Rook.new([7,0], :black, "\u265C", self)
    @pieces << Rook.new([7,7], :black, "\u265C", self)
    @pieces << Knight.new([7,1], :black, "\u265E", self)
    @pieces << Knight.new([7,6], :black, "\u265E", self)
    @pieces << Bishop.new([7,2], :black, "\u265D", self)
    @pieces << Bishop.new([7,5], :black, "\u265D", self)
    @pieces << Queen.new([7,3], :black, "\u265B", self)
    @pieces << King.new([7,4], :black, "\u265A", self)

    # White Pieces
    8.times do |index|
      @pieces << Pawn.new([1, index], :white, "\u2659", self)
    end

    @pieces << Rook.new([0,0], :white, "\u2656", self)
    @pieces << Rook.new([0,7], :white, "\u2656", self)
    @pieces << Knight.new([0,1], :white, "\u2658", self)
    @pieces << Knight.new([0,6], :white, "\u2658", self)
    @pieces << Bishop.new([0,2], :white, "\u2657", self)
    @pieces << Bishop.new([0,5], :white, "\u2657", self)
    @pieces << Queen.new([0,3], :white, "\u2655", self)
    @pieces << King.new([0,4], :white, "\u2654", self)
  end

  def print_board
    print_array = Array.new(8) { Array.new(8) }

    @pieces.each do |piece|
      print_array[piece.pos[0]][piece.pos[1]] = piece.unicode
    end

    print "     "
    puts [0, 1, 2, 3, 4, 5, 6, 7].join("    ")

    print_array.each_with_index do |row, index|
      print "#{index}  "
      row.each do |tile|
        if tile.nil?
          print "|    " if tile.nil?
        else
          print "| #{tile}  "
        end
      end
      puts "|"
      puts "   -----------------------------------------"
    end
  end
end