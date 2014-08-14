require_relative 'chess'
require_relative 'board'
require_relative 'unicode'
require_relative 'human'

class Game
  
  def initialize
    @board   = Board.new
    @player1 = HumanPlayer.new
    @player2 = HumanPlayer.new
  end
  
  def play
    current_player = @player1
    color = :w 
    until gameover?
      begin 
        current_player.play_turn(@board, color) 
      rescue 
        puts "Can't make that move. \n Enter valid coordinates (a1, b2)"
        retry
      end
      
      color = (color == :w ) ? :b : :w
      winner = (winner == "white") ? "black" : "white"
      current_player = (current_player == @player1) ? @player2 : @player1
    end
    @board.render_board
    print "#{winner.capitalize} wins!\n"
  end
  
  private
  
  def gameover?
    @board.checkmate?(:w) || @board.checkmate?(:b)
  end
end

