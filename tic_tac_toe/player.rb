class Player

  attr_accessor :name, :symbol
  @@count = 1

  def initialize
    system 'clear'
    puts "What is your name player #{Player.count}?"
    self.name = gets.chomp
    puts "What is your symbol player #{Player.count}?"
    self.symbol = gets.chomp
    @@count += 1
  end

  def self.count
    @@count
  end


end
