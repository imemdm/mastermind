class Turn
  attr_reader :maker, :breaker
  def initialize(maker, breaker)
    @maker = maker
    @breaker = breaker
    @maker.code
  end

  def play
    guesses = @breaker.guess
    @maker.feedback_message(guesses)
    @maker.add_point unless @maker.guessed?(guesses)
  end
end