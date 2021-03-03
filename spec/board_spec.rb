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
end
