require "./Piece.rb"
require "./piece_modules.rb"
require "./Queen.rb"
require "./Rook.rb"
require "./Bishop.rb"
require "./Board.rb"
require "./King.rb"
require "./Knight.rb"
require "./Pawn.rb"
require 'pp'

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
    @player1, @player2 = get_players
    @current_player = @player1
  end

  def play
    until game_over?
      system('clear')
      board.print
      make_move(current_player)

      toggle_players
    end

    declare_winner(toggle_players)
  end

  def get_players
  end

  def game_over?
  end

  def declare_winner(player)
    puts "You won #{player.name}"
  end

  def self.is_color_checked?(color, board)
    @board = board
    opposing_color = Board::swap_color(color)
    opposing_pieces = @board.get_pieces(opposing_color)
    my_king_pos = @board.find_king(color).pos
    all_opposing_moves = []
    opposing_pieces.each do |piece|
      all_opposing_moves << piece.possible_moves
    end
    all_opposing_moves = all_opposing_moves.flatten.each_slice(2).to_a
    all_opposing_moves.include?(my_king_pos)
  end



  def toggle_players
    if @current_player == @player1
      @current_player == @player2
    else
      @current_player == @player1
    end
  end

  def make_move
  end

end

m = 1
b = Board.new
p b.pieces[m].class
p b.pieces[m].color
b.make_move([0,0],[5,0])
p b.pieces[m].possible_moves
b.print_board
p Game::is_color_checked?(:white, b)





=begin

Board Class


Piece Class
> sub classes

class for each piece

use sliding_piece and static piece as Modules




Game Class
=end
