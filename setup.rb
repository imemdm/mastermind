require "./Player.rb"
require "./CodeMaker.rb"
require "./CodeBreaker.rb"
require "./Human.rb"
require "./Computer.rb"
require "./Round.rb"
require "./Game.rb"

print "Choose to start as a Code Maker(0) or Code Breaker(1): "
start_as = gets.chomp.to_i

g = Game.new(start_as)
g.start

