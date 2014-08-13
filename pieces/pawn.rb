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
        #   next
        # elsif board.occupied?(new_pos)
          valid_moves << new_pos
          # next
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
    
    # if self.color == :b

      if self.position[0] == 6
        directions << [-2, 0]
      end
      directions << [-1, 0]
    # else
    #   if self.position[0] == 1
    #     directions << [2, 0]
    #   end
    #   directions << [1, 0]
    # end
    directions 
  end
  
  def dir
    # return 1 or -1 based on color
  end


  def capture_directions
    directions = []
    # if self.color == :b
      upper_right = [@position[0]-1, @position[1]+1]
      upper_left = [@position[0]-1, @position[1]-1]
      if @board.occupied?(upper_right) && @board[upper_right].color != self.color
        directions << [dir, 1]
      end
      if @board.occupied?(upper_left) && @board[upper_left].color != self.color
        directions << [dir, -1]
      end
    # else
    #   lower_right = [@position[0]+1, @position[1]+1]
    #   lower_left = [@position[0]+1, @position[1]-1]
    #   if @board.occupied?(lower_right) && @board[lower_right].color != self.color
    #     directions << [1, 1]
    #   end
    #   if @board.occupied?(lower_left) && @board[lower_left].color != self.color
    #     directions << [1, -1]
    #   end
    # end
    directions
  end
end