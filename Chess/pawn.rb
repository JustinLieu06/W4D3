class Pawn < Piece
  # attr_reader :color, :board
  # attr_accessor :pos
  
  SIDE_MOVE_DIFFS = [
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
    ]

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol 
    :P
  end

  def moves
    valid_moves =
    [
      [pos.first + forward_dir * 1, pos.last + 0] #move forward once
    ]
    valid_moves << [pos.first + forward_dir * 2, pos.last + 0] if at_start_row? #move forward twice if at start row
    valid_moves.concat(side_attacks) #add side attacks if you can side attack
    valid_moves
  end

  def opp_color?(pos)
    if self.color == :W
      return true if @board[pos.first][pos.last].color == :B
    end

    if self.color == :B
      return true if @board[pos.first][pos.last].color == :W
    end
    false
  end

  private
  def at_start_row?
    row = pos.first
    if color == :B 
      return true if row == 1
    else
      return true if row == 6
    end
    false
  end

  def forward_dir #returns 1 or -1
    if color == :B
      return 1
    else
      -1
    end
  end

  def forward_steps
    if at_start_row?
      return [1, 2] 
    else
      return [1]
    end
  end

  def side_attacks
    valid_side_moves = []
    cur_x, cur_y = self.pos
    SIDE_MOVE_DIFFS.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) }
        if self.opp_color?(new_pos)
          valid_side_moves << new_pos
        end
      end
    end

    # valid_side_moves << [1,1] if board[x+1][y+1].color == :W && color == :B
    # valid_side_moves << [1,-1] if board[x+1][y-1].color == :W && color == :B
    # valid_side_moves << [-1,1] if board[x-1][y+1].color == :B && color == :W
    # valid_side_moves << [-1,-1] if board[x-1][y-1].color == :B && color == :W
    valid_side_moves
  end
end
