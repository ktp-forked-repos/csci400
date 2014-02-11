require_relative "NimPlayerComputer"

class NimPlayerDumb < NimPlayerComputer
  def take_turn board
    # Remove a random number of sticks from a random row.
    # Make sure the row didn't start out empty.
    row = nil
    loop do
      row = rand(board.length)
      break unless board[row] == 0
    end

    sticks = rand(board[row]) + 1
    board[row] -= sticks
    puts
    puts "Computer took #{sticks} sticks from row #{row + 1}."
    board
  end
end
