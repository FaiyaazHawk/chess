module Stepable
    def available_moves
        moves = []
        move_directions.each do |(dr,dc)|
            row = position[0]
            column = position[1]
            
            row += dr
            column += dc
            next if !board.on_board?(row, column)
            if board.empty?(row, column)
                moves << [row,column]
            end
            if !board.grid[row][column].nil? && self.enemy?(row,column)
                moves << [row,column]
            
            end
            if !board.grid[row][column].nil? && self.friend?(row,column)
                next
            end
            end
        
        moves
    end
end