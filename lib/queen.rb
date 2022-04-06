class Queen < Piece
    
    def to_s
        color == :black ? "\u265b" : "\u2655"
    end
end