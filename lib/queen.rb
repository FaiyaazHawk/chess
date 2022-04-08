require_relative "../lib/slideable.rb"

class Queen < Piece
    include Slideable
    def to_s
        color == :black ? "\u265b" : "\u2655"
    end
end