
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
        #setup_board
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

    def occupied?(row,column)
        return true if !grid[row][column].nil?
        false
    end

    def setup_board
        #black side
        set_piece(Rook.new(:black), 0, 0)
        set_piece(Knight.new(:black), 0, 1)
        set_piece(Bishop.new(:black), 0, 2)
        set_piece(Queen.new(:black), 0, 3)
        set_piece(King.new(:black), 0, 4)
        set_piece(Bishop.new(:black), 0, 5)
        set_piece(Knight.new(:black), 0, 6)
        set_piece(Rook.new(:black), 0, 7)
        
        #black pawns
        for num in 0..7 do
            set_piece(Pawn.new(:black), 1, num)
        end

        #white pawns
        for num in 0..7 do
            set_piece(Pawn.new(:white), 6, num)
        end

        #white side
        set_piece(Rook.new(:white), 7, 0)
        set_piece(Knight.new(:white), 7, 1)
        set_piece(Bishop.new(:white), 7, 2)
        set_piece(Queen.new(:white), 7, 3)
        set_piece(King.new(:white), 7, 4)
        set_piece(Bishop.new(:white), 7, 5)
        set_piece(Knight.new(:white), 7, 6)
        set_piece(Rook.new(:white), 7, 7)

    end
end

b = Board.new

b.set_piece(Rook.new(:black), 7, 0)
b.show_board


