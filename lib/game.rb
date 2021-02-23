# logic for the game
class Game
  WIN_CONDITION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze
  attr_reader :player_winner

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
    @player_winner = nil
  end

  def play
    player_moves
    game_over
  end

  def player_moves
    @active_player = @player1
    until @board.full?
      move(@active_player)
      break if winner_is(@active_player)

      @active_player = switch_player
    end
  end

  def move(player)
    cell = ask_move(player)
    player_symbol = player == @player1 ? 'O' : 'X'
    @board.update_board(cell, player_symbol)
    display_clear
    display_board(@board.generate_board)
  end

  def switch_player
    @active_player = @active_player == @player1 ? @player2 : @player1
  end

  def winner_is(player)
    player_symbol = player == @player1 ? 'O' : 'X'
    combo = @board.cells
    WIN_CONDITION.any? do |condition|
      [combo[condition[0]], combo[condition[1]], combo[condition[2]]].all? player_symbol
    end
  end

  def game_over
    return @player_winner = @active_player if winner_is(@active_player)

    @player_winner = nil
  end
end
