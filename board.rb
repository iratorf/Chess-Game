require_relative 'pieces'
require_relative 'unicode'
require 'colorize'

class Board
  include PrintPieces

  attr_accessor :board
  def initialize(fill_board = true)
    @board = Array.new(8) { Array.new(8) }
    if fill_board
      generate_board
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
    print " a  b  c  d  e  f  g  h\n"
    @board.each_with_index do |row, index|
      row.each_with_index do |piece, index2|
        square = index + index2 
        if piece.nil?
          print "   " if square.even?
          print "   ".colorize(:background => :light_black) if square.odd?
        else
          print " #{print_piece(piece)} "if square.even?
          print " #{print_piece(piece)} ".colorize(:background => :light_black) if square.odd?
        end
      end
      puts " #{index + 1}\n"
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
    type = @board[start[0]][start[1]].class
    color = @board[start[0]][start[1]].color 
    legal = @board[start[0]][start[1]].legal_moves
    if legal.include?(end_pos)
      move!(start, end_pos)
    else
      raise StandardError.new
    end
  end
 
  def move!(start_pos, end_pos)
    self[start_pos].move(end_pos) 
  end

  def colors_valid_moves(color)
    valid_moves = []
    color == :b ? other_color = :w : other_color = :b
    pieces_by_color(other_color).each do |piece|
      valid_moves.concat(piece.moves) unless piece.moves.empty?
    end
    valid_moves
  end

  def legal_array(color)
    legal_array = []
    pieces_by_color(color).each do |piece|
      legal_array.concat(piece.legal_moves) unless piece.moves.empty?
    end
    legal_array
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
  
  private
  
  def pieces_by_color(color)
    self.board.flatten.compact.select { |space| space.color == color }
  end

  def find_other_king(color)
    pieces_by_color(color).select { |element| element.class == King }[0].position
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

end

