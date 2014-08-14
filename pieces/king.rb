class King < Piece
  include Stepable
  
  def move_directions
    [[1, 0], [-1, 0], [-1, 1], [1, -1], [1, 1], [-1, -1], [0, 1], [0, -1]]
  end
  
end
