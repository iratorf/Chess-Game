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
puts
# pawn
b.move([1,5],[2,5]) # pawn 1
b.render_board
puts

b.move([6,4],[5,4]) # pawn 1
b.render_board
puts

b.move([1,6],[3,6]) # pawn 1
b.render_board
puts

b.move([7,3],[3,7]) # pawn 1
b.render_board
puts


p b.checkmate?(:w)






