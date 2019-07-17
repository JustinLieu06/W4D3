class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    "#{symbol}"
  end

  def empty?
    color == :N
  end

  def pos=(val)
    pos = val
  end

  def symbol
  end

  def moves
  end

  private
  def move_into_check?(end_pos)
  end
end

