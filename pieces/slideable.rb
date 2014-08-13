module Slideable
  def horizontal_dirs
   [[-1, 0], [1, 0], [0, -1], [0, 1]]
  end

  def diagonal_dirs
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end

  def moves
    valid_moves = []
    cur_x, cur_y = self.position
    
    self.move_directions.each do |(dx, dy)|
      i = 1
      until i == 8
        new_pos = [(cur_x + i * dx), (cur_y + i * dy)]
        if new_pos[0].between?(0, 7) && new_pos[1].between?(0, 7)
          if board.occupied?(new_pos) && self.color == board[new_pos].color
            break
          elsif board.occupied?(new_pos)
            valid_moves << new_pos
            break
          end
          valid_moves << new_pos
        end
        i += 1
      end
    end
    
    valid_moves
  end
end

