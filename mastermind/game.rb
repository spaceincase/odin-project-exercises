require './player.rb'
require './computer.rb'
require 'io/console'

class Game
  attr_accessor :player, :computer
  WIDTH = IO.console.winsize[1]
  def initialize
    system 'clear'
    player = Player.new
    computer = Computer.new
    puts "Who is making the code ('player' or 'computer')?"
    choice = gets.chomp.downcase
    case choice
    when 'player'
      play(player, computer)
    when 'computer'
      play(computer, player)
    end
  end


  def play(maker, breaker)
    system 'clear'
    code = maker.generate_code
    12.times do |i|
      puts "#{12-i} tries left"
      guess = breaker.guess
      break if check_code(code, guess)
    end

    puts "play again (y/n)?"
    gets.chomp.downcase == 'y' ? Game.new : return
  end

  private
  def check_code(code, attempt)
    if code == attempt
      puts "Code was cracked!"
      return true
    else
      message = []
      attempt.each_with_index do |v, i|
        if code[i] == attempt[i]
          message << 1
        elsif code.include?(v)
          message << 0
        else
          message << -1
        end
      end
      p message
      return false
    end
  end

end
