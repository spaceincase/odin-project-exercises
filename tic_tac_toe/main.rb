require './board.rb'
require './player.rb'
require './game.rb'

system 'clear'

puts "Welcome to tic-tac-toe in Ruby!"
player1 = Player.new
player2 = Player.new
Game.new(player1, player2).play
