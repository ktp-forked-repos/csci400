require "test/unit"
require_relative "NimPlayerSmart"

class TestSmartPlayer < Test::Unit::TestCase
  TEST_BOARD_1 = [3, 7, 9]
  TEST_BOARD_2 = [0, 3, 5, 7]
  TEST_BOARD_3 = [2, 3, 7]

  def setup
    @player = NimPlayerSmart.new
  end

  def testDigitalSum
    assert_equal 13, @player.digital_sum(TEST_BOARD_1)
    assert_equal 1, @player.digital_sum(TEST_BOARD_2)
    assert_equal 6, @player.digital_sum(TEST_BOARD_3)
  end

  def testPickRow
    @player.test_setup(TEST_BOARD_1)
    assert_equal 2, @player.pick_row(@player.digital_sum(TEST_BOARD_1))

    @player.test_setup(TEST_BOARD_2)
    assert_equal 1, @player.pick_row(@player.digital_sum(TEST_BOARD_2))

    @player.test_setup(TEST_BOARD_3)
    assert_equal 2, @player.pick_row(@player.digital_sum(TEST_BOARD_3))
  end

  def testTakeTurn
    newboard = @player.take_turn(TEST_BOARD_1)
    assert_equal 0, @player.digital_sum(newboard)

    newboard = @player.take_turn(TEST_BOARD_2)
    assert_equal 0, @player.digital_sum(newboard)

    newboard = @player.take_turn(TEST_BOARD_3)
    assert_equal 0, @player.digital_sum(newboard)
  end
end
