class CodeMaker
  attr_reader :possibilites
  
  def initialize
    @possibilites = [0, 1, 2, 3, 4, 5, 6]
  end

  def code
    pattern = []
    4.times do
      p = rand(4)
      pattern << self.possibilites[p]
    end
    pattern
  end
end