class Game
  def self.start
    print "0 to start as a code maker or 1 to start as a code breaker: "
    start_as = gets.chomp

    print "Rounds to play (even number): "
    rounds = gets.chomp.to_i

    Game.new(start_as, rounds).run
  end

  def initialize(start_as, rounds)
    @rounds = rounds
    @player1 = Player.new(:human)
    @player2 = Player.new(:computer)
    @players = [player1, player2]
    players.reverse! if start_as == "1"
  end


  # It starts a game by calling a few methods and initializing
  # a Round object, at the end it calculates the final score
  def run
    self.rounds.times do |i|
      r = Round.new(self.p1, self.p2)
      points = r.play
      self.p1.increase_total(points)
      show_current_score
      players.reverse!
    end
    settle
  end

  private

  attr_accessor :rounds, :players
  attr_reader :player1, :player2

  # Displays score after each round
  def show_current_score
    puts "Score: #{human.name} #{human.total_points} | #{computer.name} #{computer.total_points}".ljust(40)
  end

  # Calculates the final score
  def settle
    puts "Game is a DRAW" if players.firstpoints == players.last.points
    winner = players.sort_by { |player| player.score }.last
    show_winner(winner)
  end

  def winner(game_winner)
    puts "#{game_winner.name.to_s} has won the game with #{game_winner.points}"
  end 
end