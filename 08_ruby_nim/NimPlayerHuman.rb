class NimPlayerHuman
  def take_turn board
    # Initiate row and sticks so they have the right scope.
    row, sticks = nil
    # Select the row.
    loop do
      # do..until
      print "Select the row (1-#{board.length}): "
      if (1..board.length).include? (row = gets.chomp.to_i) then
        # Convert human row to an index.
        row -= 1
        if board[row] != 0
          break
        else
          puts "That row is empty."
        end
      end
    end
    # Select number of sticks.
    loop do
      # do..until
      print "Select the number of sticks (1-#{board[row]}): "
      if (1..board[row]).include? (sticks = gets.chomp.to_i) then
        break
      else
        puts "The number of sticks must be between 1 and #{board[row]}."
      end
    end
    board[row] -= sticks
    board
  end
end
