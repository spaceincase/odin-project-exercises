require 'io/console'


class Board

  attr_accessor :grid

  def initialize
    @grid = {}
    9.times {|i| grid[i] = nil}
  end


  def display
    system 'clear'
    w = IO.console.winsize[1]
    divider = "--+---+---"
    puts "-----Game Board-----".center(w)
    puts "#{@grid[0] || 1} | #{@grid[1] || 2} | #{@grid[2] || 3}".center(w)
    puts divider.center(w)
    puts "#{@grid[3] || 4} | #{@grid[4] || 5} | #{@grid[5] || 6}".center(w)
    puts divider.center(w)
    puts "#{@grid[6] || 7} | #{@grid[7] || 8} | #{@grid[8] || 9}".center(w)
    puts "--------------------".center(w)
  end

end
