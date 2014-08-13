class Piece
  include PrintPieces
  attr_reader :position, :board, :color
  
  def initialize(position, board, color)
    @position = position
    @board    = board
    @color    = color 
  end
  
  def moves
  end
  
  def move_into_check?(position)
    
  end
  
end

