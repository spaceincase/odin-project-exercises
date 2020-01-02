require 'io/console'

class Game

  attr_accessor :player1, :player2, :current_player
  WINNING_COMBOS = [[0,1,2], [3,4,5], [6,7,8], #rows
                    [0,3,6], [1,4,7], [2,5,8], #columns
                    [2,4,6], [0,4,8]]          #diaganols

  def initialize(p1, p2)
    self.player1 = p1
    self.player2 = p2
  end

  def play
    board = Board.new
    winner = nil
    current_player = player1
    until winner
      puts current_player
      turn(current_player, board)
      winner = check_winner(current_player, board)
      case current_player
      when player1
        current_player = player2
      when player2
        current_player = player1
      end
    end
    puts "It's a tie!" if winner == 'tie'
    unless winner == 'tie' || nil
      system 'clear'
      puts "#{winner} is the winner!"
      puts "Play Again? (Y/N)"
      choice = gets.chomp.upcase
      case choice
      when 'Y'
        play
      when 'N'
        system 'clear'
        puts "Thanks for playing!"
      end
    end
  end

  def turn(player, board)
    w = IO.console.winsize[1]
    board.display
    puts "#{player.name}'s Turn!".center(w)
    puts "Choose a number. (1-9)"
    choice = gets.chomp.to_i - 1
    board.grid[choice] == nil ? board.grid[choice] = player.symbol : turn(player)
  end

  def check_winner(player, board)

    p1_moves = board.grid.select{|k,v| v == player.symbol}.keys
    p1_moves = p1_moves.combination(3).to_a

    Game::WINNING_COMBOS.each do |i|
      p1_moves.each do |j|
        if j.sort == i.sort
          return player.name
        end
      end
    end
    nil
  end


end
