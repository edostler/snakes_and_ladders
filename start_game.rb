require_relative "./Player"
require_relative "./Game"
require_relative "./Dice"
require_relative "./Board"
require_relative "./Ascii"

puts Ascii.get_title

puts "Enter the first player's name:"
p1name = gets.chomp

puts

puts "Enter the second player's name:"
p2name = gets.chomp

puts

@player1 = Player.new(p1name)
@player2 = Player.new(p2name)

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

@game = Game.new(@board, [@player1, @player2])
@game.start