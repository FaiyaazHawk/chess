# frozen_string_literal: true

require_relative '../lib/piece'
require_relative '../lib/bishop'
require_relative '../lib/king'
require_relative '../lib/knight'
require_relative '../lib/pawn'
require_relative '../lib/queen'
require_relative '../lib/rook'
require_relative '../lib/slideable'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
    start_chess
  end

  def show_board
    system 'clear'
    8.times do |r|
      puts '------------------------'
      8.times do |c|
        piece = grid[r][c]
        print ' ' if piece.nil?
        print " #{piece} "
      end
      puts ''
    end
    puts '------------------------'
    puts ' 0  1  2  3  4  5  6  7'
    puts "Save with 's' and quit with 'q'"
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

  def in_check?(color)
    all_pieces.reject { |p| p.color == color }.each do |piece|
      return true if piece.available_moves.include?(king_position(color))
    end
    false
  end
  #checkmate verification by collecting the same colored pieces, duping the board and checking if there is any moves
  #that takes king out of check
  def checkmate?(color)
    return false unless in_check?(color)

    same_color_pieces = all_pieces.select { |p| p.color == color }
    same_color_pieces.each do |piece|
      piece.available_moves.each do |move|
        copy_board = Marshal.load(Marshal.dump(self))
        copy_board.move_piece(piece.position, move)
        return false unless copy_board.in_check?(color)
      end
      true
    end
    false
  end

  def all_pieces
    grid.flatten.reject(&:nil?)
  end

  def king_position(color)
    king = all_pieces.find { |p| p.color == color && p.is_a?(King) }
    king.position
  end

  def move_piece(start_pos, end_pos)
    # grab the piece
    piece = grid[start_pos[0]][start_pos[1]]
    # check if move is valid
    raise 'Not a valid move' unless piece.available_moves.include?(end_pos)
    # check if move on board
    raise 'Move out of board' unless on_board?(end_pos[0], end_pos[1])

    # remove piece from the location
    grid[start_pos[0]][start_pos[1]] = nil
    # place the piece
    grid[end_pos[0]][end_pos[1]] = piece
    # update piece internal location to end pos
    piece.position = end_pos
  end

  def start_chess
    # black pieces back row
    grid[0][0] = Rook.new(:black, self, [0, 0])
    grid[0][1] = Knight.new(:black, self, [0, 1])
    grid[0][2] = Bishop.new(:black, self, [0, 2])
    grid[0][3] = Queen.new(:black, self, [0, 3])
    grid[0][4] = King.new(:black, self, [0, 4])
    grid[0][5] = Bishop.new(:black, self, [0, 5])
    grid[0][6] = Knight.new(:black, self, [0, 6])
    grid[0][7] = Rook.new(:black, self, [0, 7])
    # black pawns
    (0..7).each do |num|
      grid[1][num] = Pawn.new(:black, self, [1, num])
    end
    # white pieces
    (0..7).each do |num|
      grid[6][num] = Pawn.new(:white, self, [6, num])
    end
    # white pieces back row
    grid[7][0] = Rook.new(:white, self, [7, 0])
    grid[7][1] = Knight.new(:white, self, [7, 1])
    grid[7][2] = Bishop.new(:white, self, [7, 2])
    grid[7][3] = Queen.new(:white, self, [7, 3])
    grid[7][4] = King.new(:white, self, [7, 4])
    grid[7][5] = Bishop.new(:white, self, [7, 5])
    grid[7][6] = Knight.new(:white, self, [7, 6])
    grid[7][7] = Rook.new(:white, self, [7, 7])
  end
end
