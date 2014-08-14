# encoding: utf-8

module PrintPieces
  UNI = {
    :w => {
      King   => "\u{2654}",
      Queen  => "\u{2655}",
      Rook   => "\u{2656}",
      Bishop => "\u{2657}",
      Knight => "\u{2658}",
      Pawn   => "\u{2659}"
    },
    :b => {
      King   => "\u{265A}",
      Queen  => "\u{265B}",
      Rook   => "\u{265C}",
      Bishop => "\u{265D}",
      Knight => "\u{265E}",
      Pawn   => "\u{265F}"
    }
  }
  
  def print_piece(piece)
    class_point = piece.class
    color_point = piece.color
    
    UNI[color_point][class_point]
  end
end


