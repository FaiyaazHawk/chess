# frozen_string_literal: true

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
    diag_left = position[0] + forward_direction, position[1] - forward_direction
    diag_right = position[0] + forward_direction, position[1] + forward_direction
    # black start
    if position[0] == 1 && board.empty?(one_forward[0],
                                        one_forward[1]) && board.empty?(two_forward[0],
                                                                        two_forward[1]) && color == :black
      moves << two_forward
    end
    moves << one_forward if position[0] == 1 && board.empty?(one_forward[0], one_forward[1]) && color == :black
    # white start
    if position[0] == 6 && board.empty?(one_forward[0],
                                        one_forward[1]) && board.empty?(two_forward[0],
                                                                        two_forward[1]) && color == :white
      moves << two_forward
    end
    moves << one_forward if position[0] == 6 && board.empty?(one_forward[0], one_forward[1]) && color == :white
    # regular move
    if board.empty?(one_forward[0], one_forward[1]) && board.on_board?(one_forward[0], one_forward[1])
      moves << one_forward
    end
    # captures
    moves << diag_left if !board.empty?(diag_left[0], diag_left[1]) && enemy?(diag_left[0], diag_left[1])

    moves << diag_right if !board.empty?(diag_right[0], diag_right[1]) && enemy?(diag_right[0], diag_right[1])

    # filter for unique moves that are on the board
    moves.uniq.select { |m| board.on_board?(m[0], m[1]) }
  end
end
