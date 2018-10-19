class CodeMaker
  attr_reader :possibilites
  attr_accessor :pattern

  def initialize
    @possibilites = [0, 1, 2, 3, 4, 5, 6]
    @pattern = nil
  end

  # Public method that generates codes
  def code
    generate_random_code
  end

  def feedback_message(break_pattern)
    fb = feedback(break_pattern)

    puts "#{fb[:same]} identical | #{fb[:value]} correct value"
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
  def feedback(break_pattern)
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