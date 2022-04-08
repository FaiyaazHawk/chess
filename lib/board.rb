
require_relative "../lib/piece.rb"
require_relative "../lib/bishop.rb"
require_relative "../lib/king.rb"
require_relative "../lib/knight.rb"
require_relative "../lib/pawn.rb"
require_relative "../lib/queen.rb"
require_relative "../lib/rook.rb"


class Board
    attr_accessor :grid
    
    def initialize
        @grid = Array.new(8){Array.new(8, nil)}
        
    end

    def show_board
        8.times do |r|
            puts "------------------------"
            8.times do |c|
                piece = grid[r][c]
                print " #{piece} "
            end
            puts ""
        end
        puts "------------------------"
        puts " 0  1  2  3  4  5  6  7"

    end

    

    def set_piece(piece, row, col)
        grid[row][col] = piece
    end

    def remove_piece(row, col)
        grid[row][col] = nil
    end

    def empty?(row, column)
        return true if grid[row][column].nil?
    end

    def on_board?(row, column)
        row < grid.length &&
        column < grid.first.length &&
        row >= 0 &&
        column >= 0
    end
    
    

    
end

b = Board.new

b.grid[0][0] = Rook.new(:black, b, [0,0])
b.grid[0][1] = Rook.new(:white, b, [0,1])



p b.grid[0][0].available_moves
b.show_board


