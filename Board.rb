class Board
  attr_reader :spaces

  def initialize(modifiers)
    @spaces = Array.new(50)

    modifiers.each do |key, value|
      @spaces[key] = value
    end
  end

  def get_modifier_for_space(space)
    return @spaces[space]
  end
end