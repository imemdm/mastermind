class Game
  attr_accessor :rounds, :p1, :p2

  def initialize(first_in)
    @first_in = first_in
    if @first_in == 0
       @p1 = Human.new("Human")
       @p2 = Computer.new("Computer") 
    else
      @p1 = Computer.new("Computer")
      @p2 = Human.new("Human")
    end
  end

  def rounds_count
    @rounds = 0
    loop do
      print "How many rounds do you wanna play(even number): "
      @rounds = gets.chomp.to_i
      break if @rounds.even?
    end
  end

  def start
    rounds_count
    self.rounds.times do |i|
      r = Round.new(self.p1.maker, self.p2.breaker)
      points = r.play
      self.p1.increase_total(points)
      show_current_score(self.p1, self.p2)
      switch_players
    end
  end

  private
  def switch_players
    self.p1, self.p2 = self.p2, self.p1
  end

  def show_current_score(p1, p2)
    puts "Score: #{p1.name} - #{p1.total_points} | #{p2.name} - #{p2.total_points}"
  end
end