require_relative "./Dice"
require_relative "./UserInterface"

class Game
  attr_reader :board, :players, :next_player_to_move

  def initialize(board, players, test_mode=false)
    @board = board
    @players = players
    @player_positions = {}
    @next_player_to_move = 0
    @won = false
    @test_mode = test_mode

    players.each do |player|
      @player_positions[player] = 1
    end
  end

  def start
    while !@won
      advance
    end
  end

  def advance
    player = get_next_player()
    ui = UserInterface.new(@test_mode)
    
    ui.start_turn(player)

    # Roll Dice
    move = Dice.roll
    ui.roll_dice(player, move)

    # Move Player
    @player_positions[player] += move
    ui.player_move(player, @player_positions[player])

    # Check if player has landed on a snake / ladder
    modifier = @board.get_modifier_for_space(@player_positions[player])

    if modifier != nil
      @player_positions[player] += modifier
      modifier_type = modifier < 0 ? "snake" : "ladder"
      ui.put_modifier(player, modifier_type, @player_positions[player])
    end

    ui.separator()

    # Check to see if anyone has won
    if @player_positions[player] >= @board.spaces.length - 1
      @won = true
      ui.game_over(player)
    else
      @next_player_to_move = @next_player_to_move == (@players.length - 1) ? 0 : (@next_player_to_move + 1)
    end
  end

  def get_next_player
    return @players[@next_player_to_move]
  end

end