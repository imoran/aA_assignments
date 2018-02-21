require_relative "piece"

class Knight < Piece

  def initialize(color, board, pos)
    @piece = :knight
    @color = color
    @pos = pos
    @board = board
    @piece_emoji = (color == :white ? "  ♘  " : "  ♞  ")

  end
end
