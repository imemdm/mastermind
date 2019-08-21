class Round  
  def initialize(players)
    @maker = Maker.new(players.first)
    @breaker = Breaker.new(players.last)
    @round_score = 0
  end

  # Plays a single round
  def play
    1.upto(12) do |counter|
      puts "\nTurn: #{counter} - try again\n"
      turn
      break if guessed?
      round_score = counter
    end
    complete
  end

  private

  attr_accessor :round_score
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