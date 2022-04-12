require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

class Game
    attr_reader :player1, :player2, :board
    attr_accessor :current_player
    def initialize ()
        @board = Board.new
        @player1 = Player.new(:white)
        @player2 = Player.new(:black)
        @current_player = player1
    end

    def swap_player
        self.current_player = (current_player == player1 ? player2 : player1)
    end

    def play
        while !game_over?
            board.show_board
            puts "It is #{current_player.color}'s turn"
            start_pos = nil
            end_pos = nil
            loop do
                puts "Select a piece to move. Ex: 6,4 for pawn e2"
                start_pos = current_player.get_position
                r =  start_pos[0]
                c =  start_pos[1]
                if !board.grid[r][c].nil? && board.grid[r][c].color == current_player.color
                    break
                end
                puts "#{current_player.color.upcase} piece not selected"

            end
            loop do
                puts "Select a square to move to from: #{board.grid[start_pos[0]][start_pos[1]].available_moves}"
                end_pos = current_player.get_position
                if board.grid[start_pos[0]][start_pos[1]].available_moves.include?(end_pos)
                    break
                end
                puts "Please select a valid move"
            end
            board.move_piece(start_pos,end_pos)
            swap_player
        end
    end

    def game_over? # need to work on this
        false
    end


end