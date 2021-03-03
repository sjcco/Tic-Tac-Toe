require './lib/board'

describe Board do
  describe '#generate_board' do
    it 'generate a new board' do
      board = Board.new
      expect(board.generate_board.is_a?(String)).to eql(true)
    end
  end
end
