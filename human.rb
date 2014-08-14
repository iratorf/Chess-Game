require_relative 'chess'
require_relative 'board'
require_relative 'unicode'
require_relative 'game'

class HumanPlayer
  
  def play_turn(board, color)
    board.render_board
    color == :b ? name = "Black's" : name = "White's"
    puts "#{name} move: "
    input = gets.chomp.split(" ")
    if input.length != 2
      raise StandardError.new
    end
    from  = convert_input(input[0].split(""))
    to    = convert_input(input[1].split(""))
    
  
    # begin
    #   board.move(from, to)
    # rescue ArgumentError
    #   puts "Please enter a starting argument"
    #   retry
    # end
    board.move(from, to)
  end
  
  private
  
  def convert_input(number_letter)
    [number_letter[1].to_i - 1, number_letter[0].ord - 97]
  end
end