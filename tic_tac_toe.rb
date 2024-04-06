require 'pry-byebug'

module Winnable
  def winner?(p)
    case @board
    # Wins horizontally
    when board.slice(0, 3).all? {|cell| cell == p[:mark]}
      winner = p
      true
    when board.slice(3, 3).all? {|cell| cell == p[:mark]}
      winner = p
      true
    when board.slice(6, 3).all? {|cell| cell == p[:mark]}
      winner = p
      true
    # Wins vertically
    when board[0] == p[:mark] && board[3] == p[:mark] && board[6] == p[:mark] 
      winner = p
      true
    when board[1] == p[:mark] && board[4] == p[:mark] && board[7] == p[:mark]
      winner = p
      true
    when board[2] == p[:mark] && board[5] == p[:mark] && board[8] == p[:mark]
      winner = p
      true
    # Wins diagonally \
    when board[0] == p[:mark] && board[4] == p[:mark] && board[8] == p[:mark]
      winner = p
      true
    # Wins diagonally /
    when board[2] == p[:mark] && board[4] == p[:mark] && board[6] == p[:mark]
      winner = p
      true
    else
      false
    end
  end
end

class Gameboard
  include Winnable
  attr_accessor :board, :player, :computer

  def initialize
    @player = {mark: "X", turn: nil}
    @computer = {mark: "O", turn: nil}
    puts "\tLet's play Tic Tac Toe!"
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @winner = nil
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

  def show_board
    @board.each_slice(3).with_index { |cell, index|
      puts "\t\t#{cell}"
    }
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
    # make sure the player selects an empty (non-integer) cell before returning
    move = gets.chomp.to_i
    unless move.is_a? Integer
      puts "Invalid selection. Please enter a number"
    end
    @board[move] = @player[:mark]
    show_board
  end

  def score?
    if winner?(@player)
      puts "You win!"
      true
    elsif winner?(@computer) && @winner = @computer
      puts "The computer wins!"
      true
    else
      false
    end
  end

end



# create board
board = Gameboard.new()

while true
  binding.pry
  if board.score?
    board.play_again?
  else
    board.get_turn
  end
end