# frozen_string_literal: true

require_relative '../lib/slideable'

class Bishop < Piece
  include Slideable
  def to_s
    color == :black ? "\u265d" : "\u2657"
  end

  def move_directions
    [[-1, -1], [1, -1], [-1, 1], [1, 1]].freeze
  end
end
