class Board
  attr_reader :spaces

  def initialize(modifiers)
    @spaces = Array.new(51)

    for key in modifiers.keys()
      @spaces[key] = modifiers[key]
    end
  end

  def get_modifier_for_space(space)
    @spaces[space]
  end
end
