require_relative "piece"

class Rook < Piece

  def initialize(color, board, pos)
    @piece = :rook
    @color = color
    @pos = pos
    @board = board
    @piece_emoji = (color == :white ? "  ♖  " : "  ♜  ")
  end

end
