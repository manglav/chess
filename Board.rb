class Board
  def initialize
    @pieces = []

    create_pieces
  end

  def create_pieces
    # Black Pieces
    8.times do |index|
      @pieces << Pawn.new([6, index], :black, "\u265F")
    end

    @pieces << Rook.new([7,0], :black, "\u265C")
    @pieces << Rook.new([7,7], :black, "\u265C")
    @pieces << Knight.new([7,1], :black, "\u265E")
    @pieces << Knight.new([7,6], :black, "\u265E")
    @pieces << Bishop.new([7,2], :black, "\u265D")
    @pieces << Bishop.new([7,5], :black, "\u265D")
    @pieces << Queen.new([7,3], :black, "\u265B")
    @pieces << King.new([7,4], :black, "\u265A")

    # White Pieces
    8.times do |index|
      @pieces << Pawn.new([1, index], :white, "\u2659")
    end

    @pieces << Rook.new([0,0], :white, "\u2656")
    @pieces << Rook.new([0,7], :white, "\u2656")
    @pieces << Knight.new([0,1], :white, "\u2658")
    @pieces << Knight.new([0,6], :white, "\u2658")
    @pieces << Bishop.new([0,2], :white, "\u2657")
    @pieces << Bishop.new([0,5], :white, "\u2657")
    @pieces << Queen.new([0,3], :white, "\u2655")
    @pieces << King.new([0,4], :white, "\u2654")
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
          print "|__| " if tile.nil?
        else
          print "|#{tile} | "
        end
      end
      puts
      puts "   ---------------------------------------"
    end
  end
end

