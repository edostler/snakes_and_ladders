require "minitest/autorun"
require "minitest/rg"

require_relative "../Dice"

class TestDice < Minitest::Test

  def test_dice
    10.times do 
      rolled = Dice.roll
      index = Array(1..6).index(rolled)
      assert( index != nil, "Dice roll was out of range 1..6! You rolled #{rolled} ")
    end
  end

end