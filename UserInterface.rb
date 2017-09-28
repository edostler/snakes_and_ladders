require_relative "./Ascii"

class UserInterface
  def initialize(test_mode = false)
    @test_mode = test_mode
  end

  def show_title()
    puts Ascii.get_title()
  end

  def start_turn(player)
    if !@test_mode
      puts "#{player.name} is up! Press return to roll (press 'q' to quit):"
      input = gets.chomp
      if input.downcase == 'q'
        exit
      end
    end
  end

  def get_player_name(i)
    puts "Enter player #{i}'s name:"
    name = gets.chomp

    puts
    return name
  end

  def roll_dice(player, move)
    puts "#{player.name} rolls a #{move}" if !@test_mode
  end

  def player_move(player, new_position)
    puts "#{player.name} moves to position #{new_position}" if !@test_mode
  end

  def put_modifier(player, modifier_type, new_position)
    puts "#{player.name} has hit a #{modifier_type} and is now on position #{new_position}!" if !@test_mode
  end

  def end_turn
    if !@test_mode
      puts
      puts "===================="
      puts
    end
  end

  def game_over(player)
    if !@test_mode
      puts "#{player.name} has won, and says \"#{player.celebrate}\""
      puts Ascii.get_something
    end
  end

end
