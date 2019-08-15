class Game
  attr_accessor :rounds, :p1, :p2, :players
  attr_reader :human, :computer

  def self.start
    print "0 to start as a code maker or 1 to start as a code breaker: "
    start_as = gets.chomp

    print "Rounds to play (even number): "
    rounds = gets.chomp.to_i

    Game.new(start_as, rounds).run
  end

  def initialize(start_as)
    @human = Player.new("Human")
    @computer = Player.new("Computer")
    @players = [human, computer]
    players.reverse! if start_as == "1"
  end


  # It starts a game by calling a few methods and initializing
  # a Round object, at the end it calculates the final score
  def run
    rounds_count
    assign_players
    self.rounds.times do |i|
      r = Round.new(self.p1, self.p2)
      points = r.play
      self.p1.increase_total(points)
      show_current_score
      switch_players
    end
    final_score
  end

  private
  # Gives both players a role
  def assign_players
    if self.first_in == 0
      @p1 = self.human
      @p2 = self.computer
    else
      @p1 = self.computer
      @p2 = self.human
    end
  end

  # Switches players at the end of each round
  def switch_players
    self.p1, self.p2 = self.p2, self.p1
  end

  # Displays score after each round
  def show_current_score
    puts "Score: #{self.human.name} #{self.human.total_points} | #{self.computer.name} #{self.computer.total_points}".ljust(40)
  end

  # Calculates the final score
  def final_score
    if self.human.total_points > self.computer.total_points
      puts "You have won #{self.human.total_points} to #{self.computer.total_points}"
    elsif self.human.total_points < self.computer.total_points
      puts "Computer has won #{self.computer.total_points} to #{self.human.total_points}"
    else
      puts "It's a tie."
    end
  end
end