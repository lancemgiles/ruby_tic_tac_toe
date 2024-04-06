# Methods that players use to interact with Gameboard
module Gameplay
  def make_move(turn)
  end
  # is there a winner?
  def winner?
  end
  
end

# Game loop
class Gameboard
  include Gameplay
  attr_accessor :board, :player, :computer
  # start a new game (maybe choose computer or 2 player)
  def initialize
    @player = {mark: "X", turn: nil}
    @computer = {mark: "O", turn: nil}
    puts "\tLet's play Tic Tac Toe!"
    @board = {row1: [1, 2, 3], row2: [4, 5, 6], row3: [7, 8, 9]}
    update_board
    puts "\tYou are 'X' and the computer is 'O'"
    puts "\tEnter the digit of the area you want to mark"
    first_turn
    if @player[:turn] == true
      puts "\tYou start."
    elsif @player[:turn] == false
      puts "\tComputer moves first."
    end
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
  def first_turn
    num = rand(2)
    if num == 1
      @player[:turn] = true
      @computer[:turn] = false
    else
      @player[:turn] = false
      @computer[:turn] = true
    end
  end
  def get_turn
    if player[:turn] == true
      turn = gets.chomp
    else
      turn = get_computer_move
    end
  end
  def get_computer_move
    #determine and select best possible move
  end
  # repeat until win:
    # Player/Computer turn
    # update board
    # determine winner
  # Play again?
end

board = Gameboard.new()
# board.update_board