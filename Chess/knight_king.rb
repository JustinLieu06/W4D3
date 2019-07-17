class KnightKing < Piece

  attr_reader :title

  def initialize(title)
    @title = title
  end

  KNIGHT_MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  KING_MOVES = [
    [0,1],
    [0,-1],
    [1,0],
    [-1,0],
    [1,1],
    [1,-1],
    [-1,-1],
    [-1,1]
  ]

  def moves(start_pos)
    valid_moves = []
    cur_x, cur_y = start_pos
    if @title == "knight"
      KNIGHT_MOVES.each do |(dx, dy)|
        new_pos = [cur_x + dx, cur_y + dy]
        if new_pos.all? { |coord| coord.between?(0, 7) }
          valid_moves << new_pos
        end
      end
    else
      KING_MOVES.each do |(dx, dy)|
        new_pos = [cur_x + dx, cur_y + dy]
        if new_pos.all? { |coord| coord.between?(0, 7) }
          valid_moves << new_pos
        end
      end
    end
    valid_moves
  end
end