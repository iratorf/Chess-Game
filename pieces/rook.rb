# -*- coding: utf-8 -*-

class Rook < Piece
  include Slideable
  
  def move_directions
    self.horizontal_dirs
  end
  
end

# castle = Rook.new([2,3], nil, nil)
# p castle.moves