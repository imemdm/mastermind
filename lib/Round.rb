class Round  
  def initialize(players)
    @maker = Maker.new(players.first)
    @breaker = Breaker.new(players.last)
    @round_score = 0
  end

  # Plays a single round
  def play
    1.upto(12) do |counter|
      puts "\nTurn: #{counter}\n"
      turn
      break if guessed?
      round_score = counter
    end
    complete
  end

  private

  attr_accessor :round_score
  attr_reader :maker, :breaker, :players

  def turn
    g = breaker.guess
    puts "Guess: #{g}"
    fb = Maker.give_feedback(g, maker.code)
    puts "Feedback: #{fb}"
    breaker.previous_data = [g, fb]
  end

  def guessed?
    maker.code == breaker.current_guess
  end

  def complete
    puts "Code Breaker has guessed the code" if guessed?
    puts "Round over. Code Maker points this round: #{round_score}"
    maker.player.points += round_score
  end
end