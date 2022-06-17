# frozen_string_literal: true

require_relative '../lib/slideable'

class Queen < Piece
  include Slideable
  def to_s
    color == :black ? "\u265b" : "\u2655"
  end

  def move_directions
    [[0, 1], [0, -1], [1, 0], [-1, 0], [-1, -1], [1, -1], [-1, 1], [1, 1]].freeze
  end
end
