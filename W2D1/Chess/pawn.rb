require_relative "piece"

class Pawn < Piece

  def initialize(color, board, pos)
    @piece = :pawn
    @color = color
    @pos = pos
    @board = board
    @piece_emoji = (color == :white ? "  ♙  " : "  ♟  ")
  end
end
