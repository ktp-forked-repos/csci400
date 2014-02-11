# "Smart computer player" NIM algorithm based on information from
# http://www.cdf.toronto.edu/~ajr/270/probsess/03/strategy.html
# and www.2020tech.com/fruit/tech.html
require_relative "NimPlayerComputer"

class NimPlayerSmart < NimPlayerComputer
  def take_turn board
    @board = board
    # Make the perfect move.
    take_sticks
    @board
  end

  def pick_row sum
    row = nil
    # Pick a row with a 1 in the leftmost bit having a 1 in the sum row.
    # Some ruby magic with number format conversion.
    fail "Out of Kernel: Human must play first!" unless sum != 0
    sum_bit = (sum.to_s(2).length) - (sum.to_s(2).index '1') - 1
    @board.length.times do |index|
      row_bit = @board[index].to_s(2).reverse[sum_bit]
      if row_bit == '1' then
        row = index
        break
      end
    end
    row
  end

  def take_sticks
    # In a chosen row, change the bit in every position having a 1 in
    # the same position in the sum.
    sum = digital_sum @board
    index = pick_row sum
    row = @board[index]
    newrow = row.to_s(2)
    # More ruby format conversion.
    sum.to_s(2).length.times do |index|
      sindex = sum.to_s(2).length - index - 1
      rindex = newrow.length - index - 1
      if rindex == -1 then break end
      if sum.to_s(2)[sindex] == '1'
        if newrow[rindex] == '1'
          newrow[rindex] = '0'
        elsif newrow[rindex] == '0'
          newrow[rindex] = '1'
        end
      end
    end
    @board[index] -= (row - newrow.to_i(2))
  end

  def digital_sum list
    # Apply a bitwise xor to retrieve the digital sum of a set of
    # numbers.
    result = nil
    list.each do |number|
      if !result
        result = number
        next
      end
      result = result^number
    end
    result
  end

  def test_setup board
    @board = board
  end
end
