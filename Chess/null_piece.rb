require_relative "piece"
require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :color

  def initialize
    @color = :O
  end

  def moves
  
  end

  def symbol
    :N
  end

end