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

  def guessed?
    maker.code == breaker.current_guess
  end

  def complete

  end
end