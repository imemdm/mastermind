class Round
  attr_accessor :previous_data
  
  def initialize(players)
    @players = players
    @code = players.first.generate_code
    @previous_data = {}
  end

  # Plays a single round
  def play
    12.times do |n|
      break if guessed?
      puts "\nTurn: #{n} - try again\n"
    end
    complete
    self.maker.announce_points
    self.maker.points
  end

  private

  attr_reader :players, :code
  
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

  def guessed?

  end

  def complete

  end
end