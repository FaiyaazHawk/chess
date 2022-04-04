class Board
    attr_accessor :grid
    
    def initialize
        @grid = Array.new(8){Array.new(8, nil)}
    end

    def draw_board
        pp grid
    end
end

b = Board.new
b.draw_board