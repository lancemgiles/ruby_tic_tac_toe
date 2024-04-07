require 'pry-byebug'

module TicTacToe
  WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
         [0, 3, 6], [1, 4, 7], [2, 5, 8],
         [0, 4, 8], [2, 4, 6]]

  class Gameboard
    def initialize(player1, player2)
      @board = Array.new(10)
      @current_player_id = 0
      @players = [player1.new(self, "X"), player2.new(self, "O")]
      puts "\tLet's play Tic Tac Toe!"
      print_board
      puts "\tYou are 'X' and the computer is 'O'"
      puts "\tEnter the digit of the area you want to mark"
      puts "#{current_player} go first."
    end
    attr_reader :board, :current_player_id
    # game loop
    def play
      loop do
        place_mark(current_player)
        if winner?(current_player)
          puts "#{current_player} wins!"
          print_board
          return
        elsif full?
          puts "Draw."
          return
        end
        switch_players!
      end
    end

    def open_spots
      (1..9).select {|position| @board[position].nil?}
    end

    def full?
      open_spots.empty?
    end

    def place_mark(p)
      pos = p.select_pos!
      @board[pos] = p.mark
    end

    def winner?(p)
      WINNING_LINES.any? do |line|
        line.all? {|pos| @board[pos] == p.mark}
      end
    end

    def other_player_id
      1 - @current_player_id
    end

    def switch_players!
      @current_player_id = other_player_id
    end

    def current_player
      @players[current_player_id]
    end

    def opponent
      @players[other_player_id]
    end

    def turn_num
      10 - open_spots.size
    end

    def print_board
      column_sep = "|"
      row_sep = "--+--+--"
      label_pos = lambda{|pos| @board[pos] ? @board[pos] : pos}
      row_display = lambda{|row| row.map(&label_pos).join(column_sep)}
      row_pos= [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      row_display = row_pos.map(&row_display)
      puts row_display.join("\n" + row_sep + "\n")
    end
  end

  class Player
    def initialize(game, mark)
      @game = game
      @mark = mark
    end
    attr_reader :mark
  end

  class Human < Player
    def select_pos!
      @game.print_board
      loop do
        selection = gets.to_i
        return selection if @game.open_spots.include?(selection)
        puts "#{selection} is not available, try another."
      end
    end
    def to_s
      "You"
    end
  end

  class Computer < Player
    def select_random_pos!
      loop do
        selection = rand(9)
        return selection if @game.open_spots.include?(selection)
      end
    end
    def to_s
      "Computer"
    end
  end

end

include TicTacToe

# create board
players = [Human, Computer].shuffle
Gameboard.new(*players).play