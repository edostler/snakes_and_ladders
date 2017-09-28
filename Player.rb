class Player
  attr_accessor :position
  attr_reader :name

  def initialize(name)
    @name = name
    @celebrations = [
      "In your face!",
      "Loooooser!",
      "I AM THE VICTOR!",
      "Let's play for money next time...?"
    ]
    @position = 0
  end

  def celebrate
    @celebrations.sample()
  end
end
