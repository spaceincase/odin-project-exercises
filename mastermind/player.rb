class Player

  attr_reader :name
  COLORS = ['red','green','blue','yellow','orange','purple']

  def initialize
    system 'clear'
    puts "What is your name?"
    name = gets.chomp
  end

  def guess
    generate_code
  end

  def generate_code
    code = []
    4.times do |i|
      p Player::COLORS
      puts "Pick a color for slot #{i}"
      code << gets.chomp
      system 'clear'
    end
    code
  end

end
