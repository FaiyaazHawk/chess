class Knight < Piece
    
    def to_s
        color == :black ? "\u265e" : "\u2658"
    end
end