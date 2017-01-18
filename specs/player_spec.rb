require "minitest/autorun"
require "minitest/rg"

require_relative "../Player"

class PlayerTest < Minitest::Test
  def setup
    @player1 = Player.new("John")
    @player2 = Player.new("Andy")
  end

  def test_player_name
    assert_equal("John", @player1.name)
    assert_equal("Andy", @player2.name)
  end

  def test_celebrate
    5.times do
      celebration = @player1.celebrate
      assert(celebration != nil, "@player1 did not celebrate!")
    end
  end
end