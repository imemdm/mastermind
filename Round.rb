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
    end
    self.maker.announce_points
    self.maker.points
  end

  private
  def next_turn(count)
    current_guess = @breaker.guess
    @maker.show_feedback(current_guess)
    p current_guess
    if self.maker.guessed?(current_guess)
      self.breaker.announce_guessed(count)
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