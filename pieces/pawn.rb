# -*- coding: utf-8 -*-
require_relative 'piece'
require_relative 'stepable'


class Pawn < Piece
  
  def moves
    valid_moves = []
    cur_x, cur_y = self.position 
    
    self.capture_directions.each do |(dx, dy)|
      new_pos = [(cur_x + dx), (cur_y + dy)]

      if new_pos[0].between?(0, 7) && new_pos[1].between?(0, 7)
        if board.occupied?(new_pos) && self.color != board[new_pos].color
          valid_moves << new_pos
        end
      end
    end
    
    self.move_directions.each do |(dx, dy)|
      new_pos = [(cur_x + dx), (cur_y + dy)]

      if new_pos[0].between?(0, 7) && new_pos[1].between?(0, 7)
        if board.occupied?(new_pos)
          next 
        end
        valid_moves << new_pos
      end
    end
   
    valid_moves
  end
  

  def move_directions
    directions = []

      if self.position[0] == 6 || 1
        directions << [2*dir, 0]
      end
      directions << [1*dir, 0]
    directions 
  end

  def capture_directions
    directions = []

     right = [@position[0]+dir, @position[1]+1]
     left = [@position[0]+dir, @position[1]-1]
      if @board.occupied?(right) && @board[right].color != self.color
        directions << [dir, 1]
      end
      if @board.occupied?(left) && @board[left].color != self.color
        directions << [dir, -1]
      end

    directions
  end
  
  private
  
  def dir
    self.color == :w ? 1 : -1
  end
end