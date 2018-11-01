class Player
  attr_accessor :total_points
  attr_reader :name
  
  def initialize(name)
    @name = name
    @total_points = 0
  end

  def increase_total(round_points)
    self.total_points += round_points
  end

  def maker
    CodeMaker.new
  end

  def breaker
    CodeBreaker.new
  end
end