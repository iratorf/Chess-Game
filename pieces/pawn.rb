# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'


class Pawn < Piece
  include Stepable
  
  def capture
    directions = []
    if self.color == :b
      upper_right = [@position[0]-1, @position[1]+1]
      upper_left = [@position[0]-1, @position[1]-1]
      if @board.occupied?(upper_right) && @board[upper_right].color != self.color
        directions << [-1, 1]
      end
      if @board.occupied?(upper_left) && @board[upper_left].color != self.color
        directions << [-1, -1]
      end
    else
      lower_right = [@position[0]+1, @position[1]+1]
      lower_left = [@position[0]+1, @position[1]-1]
      if @board.occupied?(lower_right) && @board[lower_right].color != self.color
        directions << [1, 1]
      end
      if @board.occupied?(lower_left) && @board[lower_left].color != self.color
        directions << [1, -1]
      end
    end
    directions
  end
  
  
  def move_directions
    directions = []
    
    if self.color == :b

      if self.position[0] == 6
        directions << [-2, 0]
      end
      directions << [-1, 0]
    else
      if self.position[0] == 1
        directions << [2, 0]
      end
      directions << [1, 0]
    end
    directions + capture
  end
end