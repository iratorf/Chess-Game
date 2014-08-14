require_relative 'chess'
require_relative 'board'
require_relative 'unicode'
require_relative 'game'

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
