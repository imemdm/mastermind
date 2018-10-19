class Turn
  def initialize(maker, braker)
    @maker = maker
    @breaker = braker
    @maker.code
  end

  def play
    guesses = @breaker.guess
    @maker.feedback_message(guesses)
  end
end