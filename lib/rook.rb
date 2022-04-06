class Rook < Piece
    
    def to_s
        color == :black ? "\u265c" : "\u2656"
    end

end