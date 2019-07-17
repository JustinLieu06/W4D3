class Piece
  attr_reader :value

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
  
  end

  def empty?
    color == :N
  end

  def moves(start_pos)

  end

  def pos=(val)
    pos = val
  end

  def symbol
    
  end

  private
  def move_into_check?(end_pos)
  end
end