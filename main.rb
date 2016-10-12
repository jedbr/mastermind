require_relative 'mastermind'

class Array
  def reverse_each_with_index &block
    (0...size).reverse_each do |i|
      block.call(self[i], i)
    end
  end
end

game = Mastermind.new
game.play
