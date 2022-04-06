class Pawn < Piece
    
    def to_s
        color == :black ? "\u265f" : "\u2659"
    end
end