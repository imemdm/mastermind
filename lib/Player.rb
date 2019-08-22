class Player
  attr_accessor :total_points
  attr_reader :status
  
  def initialize(status)
    @status = status
    @total_points = 0
  end
end