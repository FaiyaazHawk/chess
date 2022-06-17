# frozen_string_literal: true

class Player
  attr_reader :color

  def initialize(color, game)
    @color = color
    @game = game
  end

  def get_position
    input = gets.chomp
    case input
    when 's'
      @game.save_game
    when 'q'
      system 'clear'
      exit
    end
    input
      .split(',') # remove comma get array
      .map(&:to_i) # convert string to integer
  end
end
