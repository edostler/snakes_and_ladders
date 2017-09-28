require "minitest/autorun"
require "minitest/rg"

require_relative "../Board"
require_relative "../Dice"
require_relative "../Game"
require_relative "../Player"
require_relative "../UserInterface"

class TestGame < Minitest::Test
  def setup
    @player1 = Player.new("John")
    @player2 = Player.new("Andy")

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
      48 => -47
    }

    @board = Board.new(modifiers)

    @ui = UserInterface.new(true)

    @game = Game.new(@board, [@player1, @player2], @ui)
  end

  def test_game_board
    assert_equal(@board, @game.board)
  end

  def test_players
    assert_equal(2, @game.players.length)
  end

  def test_get_next_player
    assert_equal(@player1, @game.players.first)
    @game.advance
    assert_equal(@player2, @game.players.first)

    # Check that it loops back to @player1
    @game.advance
    assert_equal(@player1, @game.players.first)
  end

  def test_check_modifier
    # We're going to manipulate the player_positions property directly :-/
    @game.player_positions[@player1] = 34
    @game.check_modifier(@player1)
    assert_equal(23, @game.player_positions[@player1])
  end

  def test_game_ends_on_last_square
    @game.player_positions[@player1] = 50
    @game.check_win(@player1)
    assert_equal(true, @game.won)
  end

  def test_game_does_finish
    @game.start
    assert(true, "The game hasn't finished!")
    assert(@game.won, "The game hasn't been won?!")
  end

end
