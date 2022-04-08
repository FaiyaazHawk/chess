class Piece
    attr_reader :color, :board, :position

    def initialize(color, board, position)
        @color = color
        @board = board
        @position = position
        
    end

    def enemy?(row,column)
        board.grid[row][column].color != color
    end

end