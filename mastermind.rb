require_relative 'mastermind/board'

class Mastermind
  attr_writer :game_won

  def initialize
    @board = Board.new(self)
    @board.generate_code
    @turn = 0
    @game_won = false
  end

  def play
    while !@game_won && @turn < 8
      @board.print_board
      make_guess
      @board.add_and_validate(@guess)
      @turn += 1
    end
    finish_game
  end

  private

  def make_guess
    puts "What's your next guess?"
    @guess = gets.chomp.split.map { |i| i.to_i }
  end

  def finish_game
    @board.print_board
  end
end