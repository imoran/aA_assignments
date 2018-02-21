
class Piece
  attr_reader :piece, :piece_emoji, :start_pos, :pos, :board, :color

  def initialize(color, board, pos)
    @piece = :piece
    @board = board
    @pos = pos
    @color = color
  end

  def inspect
    "#{piece_emoji}"
  end

  def valid_move?(pos)
    return true
  end
end
