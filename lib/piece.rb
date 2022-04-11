class Piece
    attr_reader :color, :board
    attr_accessor :position

    def initialize(color, board, position)
        @color = color
        @board = board
        @position = position
        
    end

    def enemy?(row,column)
        board.grid[row][column].color != color
    end

    def friend?(row,column)
        board.grid[row][column].color == color
    end

end