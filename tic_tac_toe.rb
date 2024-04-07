require 'pry-byebug'

module Winnable
  # Define win conditions
   def winner?(p)
    row1 = [0, 1, 2]
    row2 = [3, 4, 5]
    row3 = [6, 7, 8]
    column1 = [0, 3, 6]
    column2 = [1, 4, 7]
    column3 = [2, 5, 8]
    diag_top_left = [0, 4, 8]
    diag_top_right = [2, 4, 6]
    # check p move history
    p[:moves] == (row1 || row2 || row3 ||
      column1 || column2 || column3 || diag_top_right || diag_top_left)
 
    
  end
  def score?
    if winner?(player)
      puts "You win!"
      true
    elsif winner?(self.computer)
      puts "The computer wins!"
      true
    else
      false
    end
  end
end

# methods for displaying the gameboard
module Showable
  def show_board
    @board.each_slice(3).with_index { |cell, index|
      puts "\t\t#{cell}"
    }
  end
end

# Gameboard object
class Gameboard
  include Winnable
  include Showable
  attr_accessor :board, :player, :computer
  #create gameboard, player, set up
  def initialize
    @player = {mark: "X", turn: nil, moves: []}
    @computer = {mark: "O", turn: nil, moves: []}
    puts "\tLet's play Tic Tac Toe!"
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    show_board
    puts "\tYou are 'X' and the computer is 'O'"
    puts "\tEnter the digit of the area you want to mark"
    first_turn
    if @player[:turn] == true
      puts "\tYou start."
    elsif @player[:turn] == false
      puts "\tComputer moves first."
    end
  end

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
    if @player[:turn] == true
      get_player_move
      @player[:turn] = false
      @computer[:turn] = true
    else
      turn = get_computer_move
      @player[:turn] = true
      @computer[:turn] = false
    end
  end

  def get_computer_move
    #determine and select best possible move
    puts "to do"
    show_board
  end

  def get_player_move
    move = gets.chomp.to_i
    if move < 9 && @board[move] != @computer[:mark]
      @board[move] = @player[:mark]
      @player[:moves].push(move)
      show_board
    else
      while move >= 9
        puts "Invalid selection."
        move = gets.chomp.to_i
      end
    end
  end
end



# create board
game = Gameboard.new()

# game loop
i = 0
while i < 10
  #binding.pry
  if game.score?
    game.play_again?
  else
    game.get_turn
  end
  i =+ 1
end