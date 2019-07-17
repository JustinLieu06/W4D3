module Slideable
  private
  DIAGONAL_DIRS = [ [1,1], [1,-1], [-1,1], [-1,-1] ]
  HORIZONTAL_DIRS = [ [1,0], [0,1], [-1,0], [0,-1] ]
  
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
  require "byebug"
  def moves
    valid_moves = []
    cur_x, cur_y = self.pos
    move_dirs.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end
    debugger
    full_moves = valid_moves

    valid_moves.each do |move|
      step_move = move
      curr_piece = self.board[step_move]
      while step_move.all? { |coord| coord.between?(0,7) }
        dir = grow_unblocked_moves_in_dir(step_move.first, step_move.last)
        step_move = [move.first + dir.first, move.last + dir.last]
        if curr_piece.color == :N
          full_moves << step_move
          break
        elsif curr_piece.opp_color?(move)
          full_moves << step_move
          break
        else
          break
          #same color so don't shovel in
        end
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

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    :R
  end

  def move_dirs
    horizontal_dirs
  end
end

class Bishop < Piece
  include Slideable

  def Bishop
    :I
  end

  def move_dirs
    diagonal_dirs
  end

end

class Queen < Piece
  include Slideable

  def symbol
    :Q
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end
end