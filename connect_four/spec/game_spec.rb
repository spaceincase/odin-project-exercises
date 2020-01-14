require './lib/game.rb'

describe Game do
  describe '#create_game_grid' do
    it 'returns a 2d array to represent the grid' do
      game = Game.new
      expect(user.create_game_grid).to eql([[nil,nil,nil,nil,nil,nil,nil],
                                            [nil,nil,nil,nil,nil,nil,nil],
                                            [nil,nil,nil,nil,nil,nil,nil],
                                            [nil,nil,nil,nil,nil,nil,nil],
                                            [nil,nil,nil,nil,nil,nil,nil],
                                            [nil,nil,nil,nil,nil,nil,nil])
    end
  end

  describe '#display_grid' do
    it 'returns the contents of grid' do
      game = Game.new
      expect(game.display_grid).to eql()
    end
  end

  describe '#add_piece_to_grid' do
    it 'places a piece in the first row' do
      game = Game.new
      expect(game.add_piece_to_grid(1, player1.piece)).to eql([
        [player1.piece,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil])
    end

    it 'pieces end up on top of eachother' do
      game = Game.new
      game.add_piece_to_grid(1, player1.piece)
      expect(game.add_piece_to_grid(2, player1.piece)).to eql([
          [player1.piece,nil,nil,nil,nil,nil,nil],
          [player1.piece,nil,nil,nil,nil,nil,nil],
          [nil,nil,nil,nil,nil,nil,nil],
          [nil,nil,nil,nil,nil,nil,nil],
          [nil,nil,nil,nil,nil,nil,nil],
          [nil,nil,nil,nil,nil,nil,nil])
    end
  end

  describe '#check_grid_for_winner' do
    it 'finds winner in rows' do
      game = Game.new
      4.times do |i|
        game.add_piece_to_grid(i+1, player1.piece)
      end
      expect(game.check_grid_for_winner).to eql(game.player1)
    end

    it 'finds winner in columns' do
      game = Game.new
      4.times do
        game.add_piece_to_grid(1, player1.piece)
      end
      expect(game.check_grid_for_winner).to eql(game.player1)
    end

    it 'finds winner in diagonals' do
      game = Game.new
    end
  end

end
