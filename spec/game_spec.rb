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

  describe '#winner_is' do
    it 'returns player name if the is a winner' do
      game = Game.new('carlos', 'juan')
      game.force_winner('carlos')
      expect(game.winner_is).to eql 'carlos'
    end

    it 'returns nil if there is no winner' do
      game = Game.new('carlos', 'juan')
      expect(game.winner_is).to eql nil
    end
  end

  describe '#switch_player' do
    it 'changes the active player' do
      game = Game.new('carlos', 'juan')
      active = game.active_player
      expect(game.switch_player).to_not eql(active)
    end
  end
end
