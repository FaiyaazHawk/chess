# frozen_string_literal: true

require_relative '../lib/stepable'

class Knight < Piece
  include Stepable
  def to_s
    color == :black ? "\u265e" : "\u2658"
  end

  def move_directions
    [[-2, -1], [-1, -2], [1, -2], [2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1]].freeze
  end
end
