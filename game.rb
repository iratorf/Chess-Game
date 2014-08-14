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
    until gameover?
      begin 
        @player1.play_turn(@board, :w) 
      rescue 
        puts "Can't make that move. \n Enter valid coordinates (a1, b2)"
        retry
      end
      
      winner = "white"
      break if gameover?
      
      begin 
          @player2.play_turn(@board, :b)
      rescue 
        puts "Can't make that move. \n Enter valid coordinates (a1, b2)"
        retry
      end
      
      winner = "black"
    end
    @board.render_board
    print "#{winner.capitalize} wins!\n"
  end
  
  private
  
  def gameover?
    if @board.checkmate?(:w) || @board.checkmate?(:b)
      return true
    end
    false
  end
  
end

