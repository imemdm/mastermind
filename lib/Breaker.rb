class Breaker
  attr_accessor :current_guess, :previous_data
  attr_reader :ai

  def initialize(player)
    @player = player
    @ai = AI.new
    @current_guess = nil
    @previous_data = []
  end

  # Generic method that outputs all guesses
  def guess
    self.current_guess = player.status == :computer ? 
      generate_guess : InputHandler.guess_code
  end

  private

  attr_reader :player

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