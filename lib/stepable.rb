# frozen_string_literal: true
#for pieces that have a definite step they can take (including over pieces)
module Stepable
  def available_moves
    moves = []
    move_directions.each do |(dr, dc)|
      row = position[0]
      column = position[1]

      row += dr
      column += dc
      next unless board.on_board?(row, column)

      moves << [row, column] if board.empty?(row, column)
      moves << [row, column] if !board.grid[row][column].nil? && enemy?(row, column)
      next if !board.grid[row][column].nil? && friend?(row, column)
    end

    moves
  end
end
