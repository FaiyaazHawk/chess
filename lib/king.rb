class King < Piece
    
    def to_s
        color == :black ? "\u265a" : "\u2654"
    end

    def move_directions
        [[0, 1], [0, -1], [1, 0], [-1, 0], [-1,-1],[1,-1],[-1,1], [1,1]].freeze
    end
end