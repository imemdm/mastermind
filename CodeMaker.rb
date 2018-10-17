class CodeMaker
  attr_reader :possibilites

  def initialize
    @possibilites = [0, 1, 2, 3, 4, 5, 6]
  end

  # Generates a pattern with 4 random elements
  # picked from @possibilites
  def code
    pattern = []
    4.times do
      p = rand(4)
      pattern << self.possibilites[p]
    end
    pattern
  end
end