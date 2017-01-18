class Player
  attr_reader :name
  def initialize(name)
    @name = name
    @celebrations = [
      "In your face!",
      "Loooooser!",
      "I AM THE VICTOR!",
      "Let's play for money next time...?"
    ]
  end

  def celebrate
    @celebrations.sample
  end
end