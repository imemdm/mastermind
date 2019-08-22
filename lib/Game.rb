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

  # It plays a full game with the given number of rounds
  def run
    rounds.times do |i|
      r = Round.new(players).play
      players.reverse!
    end
    settle
  end

  private

  attr_accessor :players
  attr_reader :player1, :player2, :rounds

  # Compares the scores of both players
  def settle
    puts "Game is a DRAW" if players.first.points == players.last.points
    winner = players.sort_by { |player| player.score }.last
    show_winner(winner)
  end

  # Displays details of the winning player
  def winner(game_winner)
    puts "#{game_winner.name.to_s} has won the game with #{game_winner.points}"
  end 
end