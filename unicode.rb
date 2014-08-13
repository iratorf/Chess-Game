# encoding: utf-8



module PrintPieces
  UNI_PIECES = [
    white_king   = "\u{2654}",
    white_queen  = "\u{2655}",
    white_rook   = "\u{2656}",
    white_bishop = "\u{2657}",
    white_knight = "\u{2658}",
    white_pawn   = "\u{2659}",

    black_king   = "\u{265A}",
    black_queen  = "\u{265B}",
    black_rook   = "\u{265C}",
    black_bishop = "\u{265D}",
    black_knight = "\u{265E}",
    black_pawn   = "\u{265F}"
  ]
  
  
  u = {
    :w => {
    white_king   => "\u{2654}",
    white_queen  => "\u{2655}",
    white_rook   => "\u{2656}",
    white_bishop => "\u{2657}",
    white_knight => "\u{2658}",
    white_pawn   => "\u{2659}"
    },
    :b => {
    black_king   => "\u{265A}",
    black_queen  => "\u{265B}",
    black_rook   => "\u{265C}",
    black_bishop => "\u{265D}",
    black_knight => "\u{265E}",
    black_pawn   => "\u{265F}"
    }
  }
  
  
  def print_piece(piece)
    class_point = piece.class.to_s[0]
    color_point = piece.color
    
    p class_point
    p color_point
  end
  
  
end


