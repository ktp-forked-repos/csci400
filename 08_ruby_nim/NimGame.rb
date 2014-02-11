require "enumerator"
require_relative "NimPlayerHuman"
require_relative "NimPlayerComputer"
require_relative "NimPlayerDumb"
require_relative "NimPlayerSmart"

class NimGame
  HUMAN = "Human"
  COMPUTER = "Computer"
  MARK = 'X'
  @@boards = [
      [1, 3, 5, 7],
      [4, 3, 7],
  ]

  def initialize
    # Human plays first.
    @last_player = COMPUTER
    # Find computer players with introspection.
    @computer_players = ObjectSpace.enum_for(:each_object, class << NimPlayerComputer; self; end).to_a
    # Remove the parent.
    @computer_players.delete NimPlayerComputer
    # Create a human player.
    @human_player = NimPlayerHuman.new
  end

  def play
    # Start a Nim game
    puts "Welcome to NIM!"
    # Choose a board.
    @board = @@boards[choose @@boards, "board configuration"]
    # Choose a computer player.
    @computer_player = (@computer_players[choose @computer_players, "computer player"]).new
    # Keep playing until the board is empty.
    until @board.uniq == [0]
      play_round
    end
    # Print the winner and exit.
    puts "#{@last_player} wins the game!"
    puts "Thank you for playing."
  end

  def play_round
    if @last_player == COMPUTER
      # Human's turn.
      print_board
      @board = @human_player.take_turn @board
      @last_player = HUMAN
    else
      # Computer's turn.
      @board = @computer_player.take_turn @board
      @last_player = COMPUTER
    end
  end

  def print_board
    puts
    @board.each do |row|
      puts "Row #{(@board.index row) + 1}: #{MARK*row}"
    end
  end

  def choose choices, prompt
    # Skip small lists.
    return 0 unless choices.length > 1
    # Prompt the user to choose something.
    choices.each do |choice|
      puts "#{(choices.index choice) + 1}: #{choice}"
    end
    print "Select #{prompt} (1-#{choices.length}): "
    until (1..choices.length).include? (selection = gets.chomp.to_i)
      # Recursion!
      return (choose choices, prompt) - 1
    end
    selection - 1
  end
end
