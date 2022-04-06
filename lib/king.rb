class King < Piece
    
    def to_s
        color == :black ? "\u265a" : "\u2654"
    end
end