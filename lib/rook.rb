class Rook < Piece
    
    def to_s
        color == :black ? "\u265c" : "\u2656"
    end

    def move_directions
        [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
    end

end