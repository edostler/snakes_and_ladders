require_relative "./Player"
require_relative "./Game"
require_relative "./Dice"
require_relative "./Board"
require_relative "./Ascii"
require_relative "./UserInterface"

ui = UserInterface.new

ui.show_title()

player1 = Player.new(ui.get_player_name(1))
player2 = Player.new(ui.get_player_name(2))

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

board = Board.new(modifiers)

game = Game.new(board, [player1, player2], ui)
game.start
