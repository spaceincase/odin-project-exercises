class Computer
  attr_accessor :difficulty, :last_guess
  COLORS = ['red','green','blue','yellow','orange','purple']
  INTIAL_GUESS = ['red', 'red', 'green', 'green']
  def initialize
    puts "What difficulty would you like? (1-3)?"
    self.difficulty = gets.chomp.to_i
    last_guess = []
  end

  def generate_code
    case difficulty
    when 1
      code = Array.new(4) {Computer::COLORS[rand(0..1)]}
      code
    when 2
      code = Array.new(4) {Computer::COLORS[rand(0..3)]}
      code
    when 3
      return Array.new(4) {Computer::COLORS[rand(0..5)]}
    else
      self.difficulty = 1
      generate_code
    end
  end

  def guess
    Computer::INTIAL_GUESS
  end


end
