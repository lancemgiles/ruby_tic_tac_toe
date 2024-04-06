# Methods that players use to interact with Gameboard
module Gameplay
  # determine who's turn it is (first turn is random)
  def get_turn
  end
  # is there a winner?
  def winner?
  end

# Game loop
class Gameboard
  include Gameplay
  # start a new game (maybe choose computer or 2 player)
  def initialize
    # create player (X) and computer (O)
    # create gameboard
  end
  # display board, empty cells have a number
  def update_board(turn)
  end
  
  def play_again?(reply)
  end
  # repeat until win:
    # Player/Computer turn
    # update board
    # determine winner
  # Play again?
end

class Player < Gameboard
  include Gameplay
  def initialize
  end
  #
end

class Computer < Gameboard
  include Gameplay
  def analyze_board
    # determine possible moves
    # return best move
  end
end