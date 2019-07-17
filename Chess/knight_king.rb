require_relative "piece"
#to_s. How do we implement? What is its purpose

module Stepable
  def moves
    valid_moves = []
    cur_x, cur_y = self.pos
    move_diffs.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end

    valid_moves
  end

  private
  def move_diffs
  end
end

class Knight < Piece
  include Stepable
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    :K
  end

  def move_diffs
    [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
    ]
  end
end

class King < Piece
  include Stepable
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    :C
  end

  def move_diffs
    [
    [0,1],
    [0,-1],
    [1,0],
    [-1,0],
    [1,1],
    [1,-1],
    [-1,-1],
    [-1,1]
    ]
  end
end

# p k = Knight.new(:W, b, [0,0], :K)
# p k.moves