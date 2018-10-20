class Round
  attr_reader :maker, :breaker
  
  def initialize(maker, breaker)
    @maker = maker
    @breaker = breaker
    @maker.code
  end

  def play
    12.times do |i|
      announce_turn(i + 1)
      break unless next_turn(i + 1)
      self.maker.add_point if i == 11
      self,maker.announce_points(self.maker.points)
    end
  end

  private
  def next_turn(count)
    guesses = @breaker.guess
    @maker.feedback_message(guesses)

    if self.maker.guessed?(guesses)
      self.braker.announce_guessed(count)
      self,maker.announce_points(self.maker.points)
      false
    else

      self.maker.add_point
      true
    end
  end

  def announce_turn(t)
    puts "\nTurn #{t}"
    puts "==============="
  end
end