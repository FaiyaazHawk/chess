# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'
require 'yaml'

class Game
  attr_reader :player1, :player2, :board
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @player1 = Player.new(:white, self)
    @player2 = Player.new(:black, self)
    @current_player = player1
  end

  def swap_player
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play_game
    puts 'Welcome to 2 player chess in the command line'
    puts 'Select 1 for new game or 2 to load saved game'
    input = gets.chomp.to_i
    puts 'Invalid input' until input.between?(1, 2) || !input.nil?
    case input
    when 1
      play
    when 2
      load_game
    end
  end

  def play
    until game_over?
      board.show_board
      take_turn
      swap_player
    end
  end

  def save_game
    Dir.mkdir('saved') unless Dir.exist?('saved')
    File.open('./saved/saved_game.yml', 'w') do |f|
      f.write(YAML.dump(self))
    end
    puts 'The game is saved'
    exit
  end

  def load_game
    yaml = YAML.load_file('./saved/saved_game.yml')
    Game.new
    @board = yaml.board
    @player1 = yaml.player1
    @player2 = yaml.player2
    @current_player = yaml.current_player
    play
  end

  def game_over?
    if board.checkmate?(current_player.color)
      puts "#{current_player.color.upcase} Lost!!"
      true
    end
  end

  def take_turn
    puts "It is #{current_player.color}'s turn"
    puts "#{current_player.color.upcase} is in check." if board.in_check?(current_player.color)
    start_pos = nil
    end_pos = nil
    loop do
      puts 'Select a piece to move. Ex: 6,4 for pawn e2'
      start_pos = current_player.get_position
      r =  start_pos[0]
      c =  start_pos[1]
      break if !board.grid[r][c].nil? && board.grid[r][c].color == current_player.color

      puts "#{current_player.color.upcase} piece not selected"
    end

    loop do
      puts "Select a square to move to from: #{board.grid[start_pos[0]][start_pos[1]].available_moves}"
      end_pos = current_player.get_position
      break if board.grid[start_pos[0]][start_pos[1]].available_moves.include?(end_pos)

      puts 'Please select a valid move'
    end
    board.move_piece(start_pos, end_pos)
  end
end
