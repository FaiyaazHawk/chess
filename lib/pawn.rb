class Pawn < Piece
    
    def to_s
        color == :black ? "\u265f" : "\u2659"
    end

    def forward_direction
        color == :black ? 1 : -1
    end

    def available_moves
        moves = []
        one_forward = position[0] + forward_direction, position[1]
        two_forward = position[0] + (forward_direction * 2), position[1]
        #black start
        if position[0] == 1 && board.empty?(one_forward[0], one_forward[1]) && board.empty?(two_forward[0], two_forward[1]) && color == :black
            moves << two_forward
        end
        if position[0] == 1 && board.empty?(one_forward[0], one_forward[1]) && color == :black
            moves << one_forward
        end
        #white start
        if position[0] == 6 && board.empty?(one_forward[0], one_forward[1]) && board.empty?(two_forward[0], two_forward[1]) && color == :white
            moves << two_forward
        end
        if position[0] == 6 && board.empty?(one_forward[0], one_forward[1]) && color == :white
            moves << one_forward
        end

        if board.empty?(one_forward[0],one_forward[1]) && board.on_board?(one_forward[0], one_forward[1])
            moves << one_forward
        end
        moves.uniq
    end
end