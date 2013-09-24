class Game
  attr_ accessor :board
  def initialize
    @board = Board.new
    @player1, @player2 = get_players
    @current_player = @player1
  end

  def play
    until game_over?
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

class Player
  attr_reader :name # At minimum
end

=begin

Board Class


Piece Class
> sub classes

class for each piece

use sliding_piece and static piece as Modules




Game Class
