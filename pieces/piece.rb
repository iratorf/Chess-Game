class Piece

  attr_accessor :position, :board, :color
  
  def initialize(position, board, color)
    @position = position
    @board    = board
    @color    = color 
  end
  
  def legal_moves
    
    valid_moves = self.moves
    legal = []
    valid_moves.each do |pos_move|
      duped_board = @board.dup_board
      duped_board.place_piece(self.class, pos_move, @color)
      duped_board.place_piece(nil, position)
      if !duped_board.in_check?(@color)
        legal << pos_move
      end
    end
    legal  
  end
  
  def move(end_pos)
    # set self pos
    # set board's pos to nil at old pos
    # (if implementing capturing) capture_other_piece
    
  end
end

