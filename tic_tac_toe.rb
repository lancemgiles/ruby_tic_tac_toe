# Methods that players use to interact with Gameboard
module Gameplay
  # determine who's turn it is (first turn is random)
  def get_turn
  end
  def make_move(turn)
  end
  # is there a winner?
  def winner?
  end
  
end

# Game loop
class Gameboard
  include Gameplay
  attr_accessor :board
  # start a new game (maybe choose computer or 2 player)
  def initialize
    # create player (X) and computer (O)
    # create gameboard
    @board = {row1: [1, 2, 3], row2: [4, 5, 6], row3: [7, 8, 9]}
  end
  def update_board
    @board.each { |key, value|
      puts "\t\t#{value}"
    }
  end
  # display board, empty cells have a number
  def play_again?
    puts "Play again? Type 'y' for yes"
    reply = gets.chomp
    if reply == 'y'
      true
    else
      abort "Finished!"
    end
  end
  # repeat until win:
    # Player/Computer turn
    # update board
    # determine winner
  # Play again?
end

class Player
  include Gameplay
  attr_accessor :player
  def initialize
    @player = player
  end
  #
end

class Computer
  include Gameplay
  attr_accessor :computer
  def initialize
    @computer = computer
  end
  def analyze_board
    # determine possible moves
    # return best move
  end
end

board = Gameboard.new()
board.update_board