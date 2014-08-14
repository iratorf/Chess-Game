class Rook < Piece
  include Slideable
  
  def move_directions
    self.horizontal_dirs
  end
  
end
