class Rook < Piece
    
    def to_s
        color == :black ? "\u265c" : "\u2656"
    end

    def move_directions
        [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
    end

    def available_moves
        moves = []
        current_row = position[0]
        current_column = position[1]
        
        move_directions.each do |r,c|

        loop do
            current_row += r
            current_column += c
            break if !board.on_board?(current_row,current_column)
            if !board.empty?(current_row,current_column)
                moves << [current_row,current_column]
            end
            end
                
        end
        moves
    end

end