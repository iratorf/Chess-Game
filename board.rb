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
  
  def place_piece(piece, pos, color = nil)
    if piece.nil?
      self.board[pos[0]][pos[1]] = nil
    else
      self.board[pos[0]][pos[1]] = piece.new(pos, self, color)  
    end
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
      # invalid input error
      return
    end
    type = @board[start[0]][start[1]].class
    color = @board[start[0]][start[1]].color 
    legal = @board[start[0]][start[1]].legal_moves
    if legal.include?(end_pos)
      self.place_piece(type, end_pos, color)
      @board[start[0]][start[1]] = nil
      # move!(start_pos, end_pos)
    else
      puts "Not a valid move"
      # invalid move error
   end
  end
  #
  # def move!(start_pos, end_pos)
  #   piece =
  # end
  #
  def colors_valid_moves(color)
    valid_moves = []
    @board.each do |row|
      row.each do |element|
        next if element.nil?
        next if element.color == color
        unless element.moves.empty?
          valid_moves.concat(element.moves)  
        end
      end
    end
    valid_moves
  end

  def legal_array(color)
    legal_array = []
    @board.each do |row|
      row.each do |element|
        next if element.nil?
        next if element.color != color
        unless element.moves.empty?
          legal_array.concat(element.legal_moves)  
        end
      end
    end
    legal_array
  end
  
  def pieces_by_color(color)
    
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
    colors_valid_moves(color).include?(king_location)
  end
  
  # assign our boards elements to the empty duped board
  
  def dup_board
    duped_board = self.class.new(false)
    self.board.each_with_index do |row, idx_row|
      row.each_with_index do |element, idx_el|
        next if element.nil?
        duped_board.place_piece(element.class, element.position, element.color)
      end
    end
    duped_board
  end
  
  def checkmate?(color)
    if in_check?(color) && self.legal_array(color).empty?
      return true
    end
    false
  end
 
  def occupied?(space)
   !self[space].nil?
  end

end

