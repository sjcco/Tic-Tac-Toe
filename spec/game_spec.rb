require './lib/game'

describe Game do
  describe '#game_over' do
    it 'returns true if there is a winner' do
      game = Game.new('carlos', 'juan')
      game.force_winner('carlos')
      expect(game.game_over('carlos')).to eql true
    end

    it 'returns false if there is no winner' do
      game = Game.new('carlos', 'juan')
      expect(game.game_over('carlos')).to eql false
    end
  end
end
