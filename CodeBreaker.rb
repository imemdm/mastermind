class CodeBreaker
  attr_accessor :guesses

  def initialize()
    @guesses = nil
  end

  # Generic method that outputs all guesses
  def guess
    self.guesses = handle_input
  end

  def announce_guessed(t)
    puts "Guessed the correct pattern in #{t} turns"
  end

  private
  # Handles a single guess
  def single(pos)
    print "Guess position #{pos}: "
    gets.chomp.to_i
  end

  # Handles the guess process from a human player's perspective
  def handle_input
    gs = []
    4.times do |i|
      g = nil
      loop do
        g = single(i + 1)
        break if valid_guess?(g)
      end
      gs << g
    end
    gs
  end

  # Checks each guess for validity
  def valid_guess?(input)
    input >= 0 && input <= 6
  end
end