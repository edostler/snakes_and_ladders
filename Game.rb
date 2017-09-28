require_relative "./Dice"

class Game
  attr_reader :board, :players, :won
  attr_accessor :player_positions

  def initialize(board, players, ui)
    @board = board
    @players = players
    @won = false
    @ui = ui
  end

  def start
    while !@won
      advance()
    end
  end

  def advance
    player = @players.first

    @ui.start_turn(player)

    # Roll Dice
    move = Dice.roll()
    @ui.roll_dice(player, move)

    # Move Player
    player.position += move
    @ui.show_player_move(player)

    # Check if player has landed on a snake / ladder
    check_modifier(player)

    @ui.end_turn

    # Check to see if anyone has won
    check_win(player)
  end

  def check_modifier(player)
    modifier = @board.get_modifier_for_space(player.position)

    if modifier != nil
      player.position += modifier
      modifier_type = modifier < 0 ? "snake" : "ladder"
      @ui.put_modifier(player, modifier_type, player.position)
    end
  end

  def check_win(player)
    if player.position >= @board.spaces.length - 1
      @won = true
      @ui.game_over(player)
    else
      @players.rotate!
    end
  end

end
