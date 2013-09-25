require "./Piece.rb"
require "./piece_modules.rb"
require "./Queen.rb"
require "./Rook.rb"
require "./Bishop.rb"
require "./Board.rb"
require "./King.rb"
require "./Knight.rb"
require "./Pawn.rb"
require 'ap'
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

b = Board.new
b.print_board
p b.pieces[14].class
pp b.pieces[14].possible_moves.to_a



=begin

Board Class


Piece Class
> sub classes

class for each piece

use sliding_piece and static piece as Modules




Game Class
=end
