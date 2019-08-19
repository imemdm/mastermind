class Player
  attr_accessor :total_points
  attr_reader :status
  
  def initialize(status)
    @status = status
    @total_points = 0
  end

  def make_code
    maker.code
  end

  private

  def maker
    CodeMaker.new(:status)
  end
end