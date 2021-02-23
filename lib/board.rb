class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def generate_board
    <<-HEREDOC

         #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
        ---+---+---
         #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
        ---+---+---
         #{@cells[6]} | #{@cells[7]} | #{@cells[8]}

    HEREDOC
  end

  def update_board(number, player_symbol)
    @cells[number - 1] = player_symbol
  end

  def valid_move?(number)
    @cells[number - 1] == number
  end

  def full?
    @cells.all? { |cell| cell =~ /[^0-9]/ }
  end
end
