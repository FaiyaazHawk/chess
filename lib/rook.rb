class Rook < Piece
    
    def to_s
        color == :black ? "\u265c" : "\u2656"
    end

    def move_directions
        [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
    end

    def available_moves
        moves = []
        move_directions.each do |(dr,dc)|
            row = position[0]
            column = position[1]
            loop do
                row += dr
                column += dc
                break if !board.on_board?(row, column)
                if board.empty?(row, column)
                    moves << [row,column]
                end            
            end
        end
        moves
    end

end