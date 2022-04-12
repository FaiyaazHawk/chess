class Player
    attr_reader :color

    def initialize(color)
        @color = color
    end

    def get_position
        gets
            .chomp #get input remove newline
            .split(",") #remove comma get array
            .map {|num| num.to_i} #convert string to integer

    end
end