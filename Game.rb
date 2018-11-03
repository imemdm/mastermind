class Game
  attr_accessor :rounds, :p1, :p2
  attr_reader :human, :computer, :first_in

  def initialize(first_in)
    @first_in = first_in
    @human = Human.new("Human")
    @computer = Computer.new("Computer") 
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
    assign_players
    self.rounds.times do |i|
      r = Round.new(self.p1, self.p2)
      points = r.play
      self.p1.increase_total(points)
      show_current_score
      switch_players
    end
  end

  private
  def assign_players
    if self.first_in == 0
      @p1 = self.human
      @p2 = self.computer
    else
      @p1 = self.computer
      @p2 = self.human
    end
  end

  def switch_players
    self.p1, self.p2 = self.p2, self.p1
  end

  def show_current_score
    puts "Score:"
    puts "#{self.human.name} | #{self.human.total_points}"
    puts "--------"
    puts "#{self.computer.name} | #{self.computer.total_points}"
  end
end