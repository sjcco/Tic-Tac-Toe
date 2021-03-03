require './lib/board'

describe Board do
  describe '#generate_board' do
    it 'generate a new board' do
      board = Board.new
      expect(board.generate_board.is_a?(String)).to eql(true)
    end
  end

  describe '#update_board' do
    it 'update @cells array' do
      board = Board.new
      board.update_board(1, 'G')
      expect(board.cells[0]).to eql('G')
    end
  end

  describe '#valid_move?' do
    it 'returns true if the move is valid' do
      board = Board.new
      expect(board.valid_move?(3)).to eql(true)
    end

    it 'returns false if the move is invalid' do
      board = Board.new
      board.update_board(1, 'G')
      expect(board.valid_move?(1)).to eql(false)
    end
  end

  describe '#full?' do
    it 'return false if the board is not full' do
      board = Board.new
      expect(board.full?).to eql false
    end

    it 'return true if the board is full' do
      board = Board.new
      board.cells.each_with_index { |_x, y| board.update_board(y, 'G') }
      expect(board.full?).to eql true
    end
  end
end
