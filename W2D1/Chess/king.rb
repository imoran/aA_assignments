require_relative "piece"

class King < Piece

  def initialize(color, board, pos)
    @piece = :king
    super(color, board, pos)
    @piece_emoji = (color == :white ? "  ♔  " : "  ♚  ")
  end
end
