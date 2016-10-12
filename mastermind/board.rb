class Mastermind
  class Board
    attr_accessor :board
    attr_reader :code

    def initialize(parent)
      @parent = parent
      @board = []
    end

    def generate_code
      @code = Array.new(4).map { |c| c = rand(1..6) }
    end

    def print_board
      system('clear')
      puts '------------------'
      puts @code.join(' ')
      @board.reverse_each_with_index do |row, i|
        print "Turn: #{i + 1} | #{row.join(' ')}\n"
      end if @board.first
      puts '------------------'
    end

    def add_and_validate(guess)
      @board << guess
      guess == @code ? @parent.game_won = true : validate(guess)
    end

    private

    def validate(guess)
    end
  end
end