# logic for the game
class Game
  WIN_CONDITION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
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
    @board.display_board
  end

  def ask_move(player)
    puts display_turn_prompt(player)
    position = gets.chomp.to_i
    return position if @board.valid_move?(position)

    puts invalid_move_warning
    ask_move(player)
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
    if winner_is(@active_player)
      puts display_congratulations
      puts winner(@active_player)
    else
      puts display_draw
    end
  end
end
