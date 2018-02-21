require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable

  def initialize(color, board, pos)
    @piece = :queen
    @piece_emoji = (color == :white ? "  ♕  " : "  ♛  ")
    super(color, board, pos)

  end
end
