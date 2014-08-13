require_relative 'pieces'
require_relative 'unicode'

class Board

  attr_accessor :board
  def initialize(fill_board = true)
    @board = Array.new(8) { Array.new(8) }
    if fill_board
      generate_board
    end
  end
  
  def generate_board
    #refactor
    [0,7].each do |i|
      i == 0 ? color = :w : color = :b
      [0,7].each do |j|
       self.place_piece(Rook, [i, j], color)
      end
    end

    [0,7].each do |i|
      i == 0 ? color = :w : color = :b
      [1,6].each do |j|
        self.place_piece(Knight, [i, j], color)
      end
    end
  
    [0,7].each do |i|
      i == 0 ? color = :w : color = :b
      [2,5].each do |j|
       self.place_piece(Bishop, [i, j], color)
      end
    end
  
    [0,7].each do |i|
      i == 0 ? color = :w : color = :b
      self.place_piece(King, [i, 4], color)
    end
  
    [0,7].each do |i|
      i == 0 ? color = :w : color = :b 
      self.place_piece(Queen, [i, 3], color)
    end
    
    [1, 6].each do |i|
      (0..7).each do |j|
        i == 1 ? color = :w : color = :b
        self.place_piece(Pawn, [i, j], color)
      end
    end

  end
  
  def place_piece(piece, pos, color)
    self.board[pos[0]][pos[1]] = piece.new(pos, self, color)  
  end
  
  def render_board
    # system 'clear'
    @board.each do |row|
      row.each do |piece|
        if piece.nil?
          print "_"
        elsif piece.class == Knight
          print "N"
        else
          print piece.class.to_s[0]
        end
        print "|"
      end
      puts "\n"
    end
  end

  def [](position)
    x, y = position[0], position[1]
    @board[x][y]
  end

  def []=(position, piece)
    x, y = position[0], position[1]
    @board[x][y] = piece
  end
  
  def move(start, end_pos)
    if start.nil?
      puts "Select a starting location"
      return
    end
    type = @board[start[0]][start[1]].class
    color = @board[start[0]][start[1]].color 
    valid_moves = @board[start[0]][start[1]].moves
    if valid_moves.include?(end_pos)
      self.place_piece(type, end_pos, color)
      @board[start[0]][start[1]] = nil
    else
      puts "Not a valid move"
   end
  end
  
  def colors_valid_moves(color)
    valid_moves = []
    @board.each do |row|
      row.each do |element|
        next if element.nil?
        next if element.color == color
        valid_moves.concat(element.moves) unless element.moves.empty?
      end
    end
    valid_moves
  end

  def find_other_king(color)
    @board.each_with_index do |row, i|
      row.each_with_index do |element, j|
        return [i, j] if element.class == King && element.color == color
      end
    end
  end   

  def in_check?(color)
    king_location = find_other_king(color)
    p king_location
    colors_valid_moves(color).include?(king_location) 
  end
  
  # assign our boards elements to the empty duped board
  
  def dup
    duped_board = self.new(false)
    self.each_with_index do |row, idx_row|
      row.each_with_index do |element, idx_el|
        duped_board[idx_row][idx_el] = element.class.new(self.position.dup, self, self.color)
      end
    end
    duped_board
  end
  
  def checkmate?
  end
 
  def occupied?(space)
   !self[space].nil?
  end

end

