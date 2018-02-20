

class Piece
  attr_reader :piece
  def initialize
    @piece = nil
  end

  def inspect
    "Piece #{piece}"
  end
end
