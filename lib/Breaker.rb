class Breaker
  attr_writer :previous_data
  attr_reader :ai, :current_guess

  def initialize(player)
    @player = player
    @ai = nil
    @current_guess = nil
    @previous_data = []
  end

  # Generic method that outputs all guesses
  def guess
    current_guess = player.status == :computer ? 
      generate_guess : InputHandler.make_guess
  end

  private

  attr_writer :current_guess
  attr_reader :previous_data, :player

  # Required logic for the computer to make a guess
  def generate_guess
    code = []
    if ai.nil?
      4.times { code << rand(6) }
    else
      code = ai.attempt(previous_data)
    end
    code
  end
end