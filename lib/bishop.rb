class Bishop < Piece

    def to_s
        color == :black ? "\u265d" : "\u2657"
    end
    
end