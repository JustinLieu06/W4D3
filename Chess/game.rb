require_relative "board"

class Game
  b = Board.new
  # pawn = Pawn.new(:B, b, [2,0])
  # p pawn.move_dirs
  #p b[[1,0]].move_dirs
  b.move_piece(:B, [1,0],[3,0]) #move black pawn
  b.render
  b.move_piece(:W, [6,1],[4,1]) #move white pawn
  b.render
  b.move_piece(:B, [3,0], [4,1]) #black pawn take white pawn
  b.render
  b.move_piece(:B, [0,1],[2,2]) #black knight move up
  b.render
  b.move_piece(:W, [7,1], [6,1]) #white king move forward
  b.render
  b.move_piece(:B, [1,7], [2,6]) #show can't move pawn in this way
  b.render
end