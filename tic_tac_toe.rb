require 'pry-byebug'

module TicTacToe
  WIN = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
         [0, 3, 6], [1, 4, 7], [2, 5, 8],
         [0, 4, 8], [2, 4, 6]]

  class Gameboard
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

    def show_board
      @board.each_slice(3){ |cell|
        puts "\t\t#{cell}"
      }
    end

    def make_move(p, m)
      @board[m] = p[:mark]
      p[:moves].push(m)
      show_board
    end

    def game_loop
      loop do
        get_turn
        if winner?(@player)
          puts "You win!"
        elsif winner?(@computer)
          puts "Computer wins!"
        elsif draw?
          puts "Draw"
        end
        binding.pry
      end
      play_again
    end

    def draw?
      available_moves.empty?
    end

    def available_moves
      (0..8).select {|position| @board[position] != [position]}
    end

    def winner?(p)
      WIN.any? {|combo|
        combo.all?{ |position| @board[position] == p[:moves]}
      }
    end

    def score?
      if winner?(self.player)
        puts "You win!"
        true
      elsif winner?(self.computer)
        puts "The computer wins!"
        true
      else
        false
      end
    end
    def play_again?
      puts "Play again? Type 'y' for yes"
      reply = gets.chomp
      if reply == 'y'
        initialize
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
        get_computer_move
        @player[:turn] = true
        @computer[:turn] = false
      end
    end
    #determine and select best possible move
    def get_computer_move
      # if ((@computer[:moves] == []) && (@board[4] == 4))
      #   move = 4
      # elsif 
      puts 'Computer move'
     # make_move(@computer, move)
    end

    def get_player_move
      move = gets.chomp.to_i
      if move < 9 && @board[move] != @computer[:mark]
        make_move(@player, move)
      else
        while move >= 9
          puts "Invalid selection."
          move = gets.chomp.to_i
        end
      end
    end
  end

end

include TicTacToe

# create board
Gameboard.new().game_loop

# game loop
# i = 0
# while i < 10
#   #binding.pry
#   if game.score?
#     game.play_again?
#   else
#     game.get_turn
#   end
#   i =+ 1
# end