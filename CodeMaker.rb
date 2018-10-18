class CodeMaker
  attr_reader :possibilites
  attr_accessor :pattern

  def initialize
    @possibilites = [0, 1, 2, 3, 4, 5, 6]
    @pattern = nil
  end

  # Generates a code with 4 random elements from @possibilites
  def code
    generate_random_code
  end

  def feedback(break_pattern)

  end

  def generate_random_code
    elements = []
    4.times do
      p = rand(4)
      elements << self.possibilites[p]
    end
    self.pattern = elements
  end
end