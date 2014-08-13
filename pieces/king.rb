# -*- coding: utf-8 -*-

class King < Piece
  include Stepable
  
  def move_directions
    [[1, 0], [-1, 0], [-1, 1], [1, -1], [1, 1], [-1, -1], [0, 1], [0, -1]]
  end
  
end

# horse = King.new([2,2], nil, nil)
# p horse.moves