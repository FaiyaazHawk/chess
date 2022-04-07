class Rook < Piece
    
    def to_s
        color == :black ? "\u265c" : "\u2656"
    end

    def move_directions
        [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
    end

    def location
        location = []
        8.times do |r|
            8.times do |c|
                if board.grid[r][c] === self
                    location << grid[r][c]
                end
            end
        end
        location
    end

end