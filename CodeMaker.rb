class CodeMaker
  attr_accessor :pattern, :points
  attr_reader :name

  def initialize(name)
    @name = name
    @pattern = nil
    @points = 0
  end

  # Public method that generates codes
  def code(name)
    if name == "Human"
      handle_code_input
    else
      generate_random_code
    end
  end

  # Displays properly formatted feedback in the console
  def show_feedback(break_pattern)
    fb = feedback(break_pattern)
    puts "#{fb[:same]} identical | #{fb[:value]} correct value"
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
  # Generates a code with 4 random elements from @possibilites
  def generate_random_code
    code = []
    4.times do
      code << rand(0..6)
    end
    self.pattern = code
  end

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

  def valid_entry?(n)
    n >= 0 && n <= 6
  end

  # Gives feedback on a given break pattern
  def feedback(code)
    break_pattern = code.dup
    pattern = self.pattern.dup
    fb = {same: 0, value: 0}

    pattern.each_with_index do |pt, pt_id|
      break_pattern.each_with_index do |bp, bp_id|
        if bp == pt && bp_id == pt_id
          fb[:same] += 1
          pattern[pt_id] = "o"
          break_pattern[bp_id] = "x"
          break
        end
      end
    end

    pattern.each_with_index do |pt, pt_id|
      break_pattern.each_with_index do |bp, bp_id|
        if bp == pt
          fb[:value] += 1
          pattern[pt_id] = "o"
          break_pattern[bp_id] = "x"
          break
        end
      end
    end
    fb
  end
end