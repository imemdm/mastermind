class Breaker
  attr_accessor :guess
  attr_reader :name, :ai

  def initialize(name)
    @ai = AI.new
    @name = name
    @guess = nil
  end

  # Generic method that outputs all guesses
  def act(name, data)
    if name == "Computer"
      self.guess = generate_guess(data)
    else
      self.guess = handle_input
    end
  end

  # Displays a message on the console
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

  # Required logic for the computer to make a guess
  def generate_guess(old_data)
    code = []
    if self.ai.nil?
      4.times do 
        code << rand(6)
      end
    else
      code = self.ai.attempt(old_data)
    end

    code
  end

  # Checks each guess for validity
  def valid_guess?(input)
    input >= 0 && input <= 5
  end
end