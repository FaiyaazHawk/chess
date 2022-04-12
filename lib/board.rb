
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
        start_chess
    end

    def show_board
        8.times do |r|
            puts "------------------------"
            8.times do |c|
                piece = grid[r][c]
                if piece.nil?
                    print " "
                end
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
    
    def start_chess
        #black pieces back row
        grid[0][0] = Rook.new(:black, self, [0,0])
        grid[0][1] = Knight.new(:black, self, [0,1])
        grid[0][2] = Bishop.new(:black, self, [0,2])
        grid[0][3] = Queen.new(:black, self, [0,3])
        grid[0][4] = King.new(:black, self, [0,4])
        grid[0][5] = Bishop.new(:black, self, [0,5])
        grid[0][6] = Knight.new(:black, self, [0,6])
        grid[0][7] = Rook.new(:black, self, [0,7])
        #black pawns
        for num in 0..7 do
            grid[1][num] = Pawn.new(:black, self, [1,num])
        end
        #white pieces
        for num in 0..7 do
            grid[6][num] = Pawn.new(:white, self, [6,num])
        end
        #white pieces back row
        grid[7][0] = Rook.new(:white, self, [7,0])
        grid[7][1] = Knight.new(:white, self, [7,1])
        grid[7][2] = Bishop.new(:white, self, [7,2])
        grid[7][3] = King.new(:white, self, [7,3])
        grid[7][4] = Queen.new(:white, self, [7,4])
        grid[7][5] = Bishop.new(:white, self, [7,5])
        grid[7][6] = Knight.new(:white, self, [7,6])
        grid[7][7] = Rook.new(:white, self, [7,7])
    end
    

    
end

