require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

class Game
    attr_reader :player1, :player2
    attr_accessor :current_player
    def initialize
        @player1 = Player.new(:white)
        @player2 = Player.new(:black)
        @current_player = player1
    end

    def swap_player
        self.current_player = (current_player == player1 ? player2 : player1)
    end

    def play
        
        puts "It is #{current_player.color}'s turn"
        

    end

    def game_over? # need to work on this
        false
    end


end