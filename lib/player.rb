class Player
    attr_reader :color

    def initialize(color, game)
        @color = color
        @game = game
    end

    def get_position
        
        input = gets.chomp
        if input == 's'
            @game.save_game
        elsif input == 'l'
            @game.load_game
        end
        input
                    .split(",") #remove comma get array
                    .map {|num| num.to_i} #convert string to integer
        
        
    end
end

