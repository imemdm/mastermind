class Player
  attr_accessor :points
  attr_reader :status
  
  def initialize(status)
    @status = status
    @points = 0
  end
end