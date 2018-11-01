class CodeMaker
  attr_reader :possibilites
  attr_accessor :pattern, :points

  def initialize
    @possibilites = [0, 1, 2, 3, 4, 5, 6]
    @pattern = nil
    @points = 0
  end

  # Public method that generates codes
  def code
    generate_random_code
  end

  # Displays properly formatted feedback in the console
  def feedback_message(break_pattern)
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
    puts "Code Maker gets #{self.points} points from this round"
  end
  
  private
  # Generates a code with 4 random elements from @possibilites
  def generate_random_code
    elements = []
    4.times do
      p = rand(self.possibilites.length)
      elements << self.possibilites[p]
    end
    self.pattern = elements
  end

  # Gives feedback on a given break pattern
  def feedback(code)
    break_pattern = code.dup
    fb = {same: 0, value: 0}
    self.pattern.each_with_index do |pt, pt_id|
      break_pattern.each_with_index do |bp, bp_id|
        if bp == pt && bp_id == pt_id
          fb[:same] += 1
          break_pattern[bp_id] = 'x'
          break
        elsif bp == pt
          fb[:value] += 1
          break_pattern[bp_id] = 'x'
          break
        end
      end
    end
    fb
  end
end