
require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
 include Slideable
  
  def move_directions
    diagonal_dirs
  end
  
end


# castle = Bishop.new([2,3], nil, nil)
# p castle.moves