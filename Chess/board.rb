require_relative "piece"
require_relative "knight_king"
require_relative "null_piece"
require_relative "pawn"
require_relative "rook_bishop_queen"

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
        if i == 1
          @board[i][j] = Pawn.new(:B, board, [i, j])
        elsif i == 6
          @board[i][j] = Pawn.new(:W, board, [i, j])
        elsif i == 0
          @board[i][j] = Knight.new(:B, board, [i,j])
        elsif i == 7
          @board[i][j] = King.new(:W, board, [i,j])
        else
          @board[i][j] = NullPiece.instance
          #@board[i][j] = Pawn.new(:B, board, [i, j])

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
  
  def move_piece(color, start_pos, end_pos)
    #p self[start_pos].class
    # if self[start_pos].class != NulllPiece
    #   raise NoPieceException
    # end

    if end_pos.any? { |coord| !coord.between?(0, 7) } #|| blocked by your own piece # put yourself in check ||piece.moves
      raise CannotMoveException
    end
    if self[start_pos].moves.include?(end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
      self[end_pos].pos = end_pos
    end
  end

  def render
    system "clear"
    @board.each do |row|
      row.each do |spot|
        print spot
        print " "
      end
      puts "\n"
    end
    #puts @board.map {|row| row.join('*')}
  end
end

#b = Board.new
# p k = Knight.new(:W, b, [0,0])
# p k.moves
# p b.[]([0,1])
#p b[0,1]
#b.move_piece([0,0],[1,7])
# b.render