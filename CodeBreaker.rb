class CodeBreaker
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  # Generic method that outputs all guesses
  def guess
    handle_input
  end

  private
  # Handles a single guess
  def single(pos)
    print "Guess position #{pos}: "
    gets.chomp.to_i
  end

  # Handles the guess process from a human player's perspective
  def handle_input
    4.times do |i|
      g = nil
      loop do
        g = single(i + 1)
        break if valid_guess?(g)
      end
      self.guesses << g
    end
    guesses
  end

  # Checks each guess for validity
  def valid_guess?(input)
    input >= 0 && input <= 6
  end
end