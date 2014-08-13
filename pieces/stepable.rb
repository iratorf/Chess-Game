module Stepable
  def moves
    
    valid_moves = []
    cur_x, cur_y = self.position 
  
    
    self.move_directions.each do |(dx, dy)|

      new_pos = [(cur_x + dx), (cur_y + dy)]

      if new_pos[0].between?(0, 7) && new_pos[1].between?(0, 7)
        if board.occupied?(new_pos) && self.color == board[new_pos].color
          break
        elsif board.occupied?(new_pos)
          valid_moves << new_pos
          break
        end
        valid_moves << new_pos
      end
    end
    valid_moves
  end
end

