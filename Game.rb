require_relative "./Dice"

class Game
  attr_reader :board, :players, :won
  attr_accessor :player_positions

  def initialize(board, players, ui)
    @board = board
    @players = players
    @player_positions = {}
    @won = false
    @ui = ui

    players.each do |player|
      @player_positions[player] = 1
    end
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
    @player_positions[player] += move
    @ui.player_move(player, @player_positions[player])

    # Check if player has landed on a snake / ladder
    check_modifier(player)

    @ui.end_turn

    # Check to see if anyone has won
    check_win(player)
  end

  def check_modifier(player)
    modifier = @board.get_modifier_for_space(@player_positions[player])

    if modifier != nil
      @player_positions[player] += modifier
      modifier_type = modifier < 0 ? "snake" : "ladder"
      @ui.put_modifier(player, modifier_type, @player_positions[player])
    end
  end

  def check_win(player)
    if @player_positions[player] >= @board.spaces.length - 1
      @won = true
      @ui.game_over(player)
    else
      @players.rotate!
    end
  end
  
end
