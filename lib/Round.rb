class Round
  attr_reader :maker, :breaker
  attr_accessor :previous_data
  
  def initialize(p1, p2)
    @maker = p1.maker
    @breaker = p2.breaker
    @maker.code(@maker.name)
    @previous_data = {}
  end

  # Plays a single round
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
  # Handles the logic for each turn, and check whether the
  # pattern has been guessed
  def next_turn(count)
    current_guess = self.breaker.act(self.breaker.name, self.previous_data)
    self.maker.show_feedback(current_guess)
    self.previous_data[:guess] = current_guess
    self.previous_data[:feedback] = self.maker.feedback(self.maker.pattern, current_guess)
    if self.maker.guessed?(current_guess)
      self.breaker.announce_guessed(count)
      false
    else
      self.maker.add_point
      true
    end
  end

  # Prints to the console
  def announce_turn(t)
    puts "\nTurn #{t}"
    puts "==============="
  end
end