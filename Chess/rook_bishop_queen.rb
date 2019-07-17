module Slideable
  private
  DIAGONAL_DIRS = [ [1,1], [1,-1], [-1,1], [-1,-1] ]
  HORIZONTAL_DIRS = [ [1,0], [0,1], [-1,0], [0.-1] ]
  
  public

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def opp_color?(pos)
    if self.color == :W
      return true if board[pos.first][pos.last].color == :B
    end

    if self.color == :B
      return true if board[pos.first][pos.last].color == :W
    end
    false
  end

  def moves
    valid_moves = []
    cur_x, cur_y = self.pos
    move_dirs.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end

    full_moves = valid_moves
    
    valid_moves.each do |move|
      step_move = move + move
      if self.board[step_move].color == :N || self.board[step_move].opp_color?(move)
        full_moves << step_move
      end
    end

    full_moves

  end

  private
  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    
  end

end

class Rook < Piece
  include Slideable

  def move_dirs
    horizontal_dirs
  end
end

class Bishop < Piece
  include Slideable

  def move_dirs
    diagonal_dirs
  end

end

class Queen < Piece
  include Slideable

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end