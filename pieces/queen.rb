require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  
  def move_directions
    horizontal_dirs + diagonal_dirs
  end
  
end
