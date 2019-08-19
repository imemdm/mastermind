class Player
  attr_accessor :total_points
  attr_reader :name
  
  def initialize(name)
    @name = name
    @total_points = 0
  end
end