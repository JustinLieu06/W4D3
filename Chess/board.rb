require_relative "piece"

class NoPieceException < StandardError
  def message
    puts "No piece here to move"
  end
end

class CannotMoveException < StandardError
  def message
    puts "Piece cannot move here"
  end
end



class Board
  attr_reader :board
  def initialize
    @board = Array.new(8) {Array.new(8)}
    default_board
    render
  end

  def default_board
    (0...@board.length).each do |i|
      (0...@board.length).each do |j|
        if i == 0 || i == 1
          @board[i][j] = Piece.new
        elsif i == 6 || i == 7
          @board[i][j] = Piece.new
        else
          @board[i][j] = "-"
        end
      end
    end
  end

  def [](pos)
    x, y = pos #[1, 2]
    board[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @board[x][y] = val
  end
  
  def move_piece(start_pos, end_pos)
    p self[start_pos].class
    if self[start_pos].class != Piece
      raise NoPieceException
    end

    if end_pos.any? { |coord| !coord.between?(0, 7) } #|| blocked by your own piece || #cannot move in that way || # put yourself in check
      raise CannotMoveException
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = "-"
  end

  def render
    # @board.each do |row|
    #   puts row.join(' ')
    # end
    puts @board.map {|spot| spot.join('*')}
  end
end

b = Board.new()
# p b.[]([0,1])
#p b[0,1]
b.move_piece([0,1],[1,7])
b.render