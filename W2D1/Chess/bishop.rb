require_relative "piece"

class Bishop < Piece

  def initialize(color, board, pos)
    @piece = :bishop
    @color = color
    @pos = pos
    @board = board
    @piece_emoji = (color == :white ? "  ♗  " : "  ♝  ")
  end




end
