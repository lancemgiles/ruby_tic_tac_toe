class Gameboard
  attr_accessor :board, :player, :computer

  def initialize
    @player = {mark: "X", turn: nil}
    @computer = {mark: "O", turn: nil}
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
    @board[move] = "X"
    show_board
  end

  def winner?
    # check if any win condition met
    # check who won
    # display winner
    play_again?
  end

end
# create board
board = Gameboard.new()

while true
  #board.winner?
  board.get_turn
end