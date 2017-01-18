require "minitest/autorun"
require "minitest/rg"

require_relative "../Board"

class TestBoard < Minitest::Test
  def setup
    modifiers = {
      5 => 10,
      8 => 4,
      13 => 6,
      20 => -4,
      25 => -18,
      30 => 9,
      32 => 7,
      34 => -11,
      40 => -5,
      42 => -3,
      49 => -48
    }

    @board = Board.new(modifiers)
  end

  def test_board_has_spaces
    assert_equal(51, @board.spaces.length)
  end

  def test_board_modifiers
    assert_equal(9, @board.get_modifier_for_space(30))
    assert_equal(-3, @board.get_modifier_for_space(42))
    assert_equal(-18, @board.get_modifier_for_space(25))
  end
end