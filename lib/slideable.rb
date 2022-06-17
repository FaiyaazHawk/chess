# frozen_string_literal: true
#for pieces that can slide in open directions till it gets to a piece
module Slideable
  def available_moves
    moves = []
    move_directions.each do |(dr, dc)|
      row = position[0]
      column = position[1]
      loop do
        row += dr
        column += dc
        break unless board.on_board?(row, column)

        moves << [row, column] if board.empty?(row, column)
        if !board.grid[row][column].nil? && enemy?(row, column)
          moves << [row, column]
          break
        end
        break if !board.grid[row][column].nil? && friend?(row, column)
      end
    end
    moves
  end
end
