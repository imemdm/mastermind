class Maker
  attr_accessor :pattern, :points

  def initialize(player)
    @player = player
    @code = generate_code
    @pattern = nil
    @points = 0
  end

  # Displays properly formatted feedback in the console
  def show_feedback(break_pattern)
    puts "Guess: #{break_pattern}"
    puts "Pattern: #{self.pattern}"
    fb = feedback(break_pattern, self.pattern)
    puts "#{fb[0]} identical | #{fb[1]} correct value"
  end

  # Gives feedback on a given break pattern
  def feedback(guess, code)
    break_pattern = guess.dup
    pattern = code.dup
    fb = [0, 0]

    pattern.each_with_index do |pt, pt_id|
      break_pattern.each_with_index do |bp, bp_id|
        if bp == pt && bp_id == pt_id
          fb[0] += 1
          pattern[pt_id] = "o"
          break_pattern[bp_id] = "x"
          break
        end
      end
    end

    pattern.each_with_index do |pt, pt_id|
      break_pattern.each_with_index do |bp, bp_id|
        if bp == pt
          fb[1] += 1
          pattern[pt_id] = "o"
          break_pattern[bp_id] = "x"
          break
        end
      end
    end
    fb
  end

  # Checks if the pattern has be guessed
  def guessed?(break_pattern)
    break_pattern == self.pattern
  end

  # Points increase after each wrong guess
  def add_point
    self.points += 1
  end

  # Display points scored at the end of the round
  def announce_points
    puts "\n"
    puts "Code Maker gets #{self.points} points from this round"
  end
  
  private

  attr_reader :player

  def generate_code
    if player.status == :human
      handle_code_input
    else
      generate_random_code
    end
  end


  # Generates a code with 4 random elements from @possibilites
  def generate_random_code
    code = []
    4.times do
      code << rand(0..5)
    end
    self.pattern = code
  end

  # Human player creates a hidden pattern
  def handle_code_input
    puts "Create a pattern..."
    code = []
    4.times do |i|
      n = -1
      loop do
        print "Enter a number: "
        n = gets.chomp.to_i
        break if valid_entry?(n)
      end
      code << n
    end
    self.pattern = code
  end

  # Checks if the given number is a valid pattern value
  def valid_entry?(n)
    n >= 0 && n <= 5
  end
end