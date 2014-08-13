require_relative 'chess'
require_relative 'board'



# run your tests!
puts '1. Show me a board!'
b = Board.new
#a.render_board

# a.place_piece(King, [0,1],:w)
# p a.board[0][1].class
# a.render_board


b.render_board

a = b.dup
p a

# puts"white pawn"
# p b.board[1][5].color
#
# puts "black pawn"
# p b.board[6][5].color
#
#
