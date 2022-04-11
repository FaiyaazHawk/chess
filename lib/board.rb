
require_relative "../lib/piece.rb"
require_relative "../lib/bishop.rb"
require_relative "../lib/king.rb"
require_relative "../lib/knight.rb"
require_relative "../lib/pawn.rb"
require_relative "../lib/queen.rb"
require_relative "../lib/rook.rb"
require_relative "../lib/slideable.rb"

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

    

    

    def empty?(row, column)
        return true if grid[row][column].nil?
    end

    def on_board?(row, column)
        row < grid.length &&
        column < grid.first.length &&
        row >= 0 &&
        column >= 0
    end

    def move_piece(start_pos, end_pos)
        #grab the piece
        piece = grid[start_pos[0]][start_pos[1]]
        #check if move is valid
        if !piece.available_moves.include?(end_pos)
            raise 'Not a valid move'
        end
        #check if move on board
        if !on_board?(end_pos[0],end_pos[1])
            raise 'Move out of board'
        end
        #remove piece from the location
        grid[start_pos[0]][start_pos[1]] = nil
        #place the piece
        grid[end_pos[0]][end_pos[1]] = piece
        #update piece internal location to end pos
        piece.position = end_pos

    end
    
    

    
end

b = Board.new

b.grid[1][2] = Pawn.new(:black, b, [1,2])

b.grid[2][3] = Pawn.new(:white, b, [2,3])

b.show_board

p b.grid[1][2].available_moves
b.move_piece([1,2], [2,3])

b.show_board


