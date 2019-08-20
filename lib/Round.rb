class Round
  attr_accessor :previous_data
  
  def initialize(players)
    @maker = Maker.new(players.first)
    @breaker = Breaker.new(players.last)
    @previous_data = {}
  end

  # Plays a single round
  def play
    12.times do |n|
      puts "\nTurn: #{n + 1} - try again\n"
      turn
      break if guessed?
    end
    complete
    self.maker.announce_points
    self.maker.points
  end

  private

  attr_reader :maker, :breaker

  def turn
    g = breaker.guess
    puts "Guess: #{g}"
    fb = maker.give_feedback
    puts "Feedback: #{fb}"
    maker.previous = [g, fb]
  end
  
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
    maker.code == breaker.current_guess
  end

  def complete

  end
end