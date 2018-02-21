require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "pawn"
require_relative "queen"
require_relative "king"

module Moveable

  STARTING_POS = {[0, 0] => (Rook.new(:black, self, [0, 0])),
                  [0, 1] => (Knight.new(:black, self, [0, 1])),
                  [0, 2] => (Bishop.new(:black, self, [0, 2])),
                  [0, 3] => (Queen.new(:black, self, [0, 3])),
                  [0, 4] => (King.new(:black, self, [0, 4])),
                  [0, 5] => (Bishop.new(:black, self, [0, 5])),
                  [0, 6] => (Knight.new(:black, self, [0, 6])),
                  [0, 7] => (Rook.new(:black, self, [0, 7])),
                  [1, 0] => (Pawn.new(:black, self, [1, 0])),
                  [1, 1] => (Pawn.new(:black, self, [1, 1])),
                  [1, 2] => (Pawn.new(:black, self, [1, 2])),
                  [1, 3] => (Pawn.new(:black, self, [1, 3])),
                  [1, 4] => (Pawn.new(:black, self, [1, 4])),
                  [1, 5] => (Pawn.new(:black, self, [1, 5])),
                  [1, 6] => (Pawn.new(:black, self, [1, 6])),
                  [1, 7] => (Pawn.new(:black, self, [1, 7])),
                  [6, 0] => (Pawn.new(:white, self, [6, 0])),
                  [6, 1] => (Pawn.new(:white, self, [6, 1])),
                  [6, 2] => (Pawn.new(:white, self, [6, 2])),
                  [6, 3] => (Pawn.new(:white, self, [6, 3])),
                  [6, 4] => (Pawn.new(:white, self, [6, 4])),
                  [6, 5] => (Pawn.new(:white, self, [6, 5])),
                  [6, 6] => (Pawn.new(:white, self, [6, 6])),
                  [6, 7] => (Pawn.new(:white, self, [6, 7])),
                  [7, 0] => (Rook.new(:white, self, [7, 7])),
                  [7, 1] => (Knight.new(:white, self, [7, 1])),
                  [7, 2] => (Bishop.new(:white, self, [7, 2])),
                  [7, 3] => (Queen.new(:white, self, [7, 3])),
                  [7, 4] => (King.new(:white, self, [7, 4])),
                  [7, 5] => (Bishop.new(:white, self, [7, 5])),
                  [7, 6] => (Knight.new(:white, self, [7, 6])),
                  [7, 7] => (Rook.new(:white, self, [7, 7]))}
end
