class Mastermind
  class Board
    attr_accessor :board
    attr_reader :code

    def initialize(parent)
      @parent = parent
      @board = []
      @hits = []
    end

    def generate_code
      @code = Array.new(4).map { |c| c = rand(1..6) }
    end

    def print_board
      system('clear')
      puts '------------------'
      puts @code.join(' ')
      @board.each_with_index do |row, i|
        print "Turn: #{i + 1} | #{row.join(' ')} | "\
              "Color and position: #{@hits[i][:color_and_position]} hits | "\
              "Color only: #{@hits[i][:color_only]} hits\n"
      end if @board.first
      puts '------------------'
    end

    def add_and_validate(guess)
      @board << guess
      @hits << {}
      color_and_position = []
      guess.each_with_index do |c, i|
        color_and_position << c if c == @code[i]
      end
      @hits.last[:color_and_position] = color_and_position.size
      @hits.last[:color_only] = (guess & @code - color_and_position).size
      @parent.game_won = true if @hits.last[:color_and_position] == 4
    end
  end
end