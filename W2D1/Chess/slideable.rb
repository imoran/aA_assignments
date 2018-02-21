module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0] , [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def diag_test(start_pos, end_pos)
    x_diff = start_pos[0] + end_pos[0]
    y_diff = start_pos[1] + end_pos[1]
    return false unless x_diff == y_diff
    start_pos.reduce(:+).even? == end_pos.reduce(:+).even?
  end

  def horiz_test(start_pos, end_pos)
    unless start_pos[0] == end_pos[0] || start_pos[1] == end_pos[1]
      return false
    end
    true
  end

  def moves
    moves = []
    move_dirs.each do |dir|
      dx = dir[0]
      dy = dir[1]
      moves += grow_unblocked_moves_in_dir(dx, dy)
    end

    moves
  end

  private

  def move_dirs
    return HORIZONTAL_DIRS if self.piece == :rook
    return DIAGONAL_DIRS if self.piece == :bishop
    return HORIZONTAL_DIRS + DIAGONAL_DIRS if self.piece == :queen
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    new_x = self.pos[0] + dx
    new_y = self.pos[1] + dy
    new_pos = [new_x, new_y]

    moves = []
    while true
      if board[new_pos].is_a?(Piece) && board[new_pos].color != self.color
        moves += new_pos
        break
      elsif board[new_pos].is_a?(Piece) && board[new_pos].color == self.color
        break
      elsif board[new_pos].nil?
        break
      else
        moves += new_pos
        new_pos[0] += dx
        new_pos[1] += dy
      end
    end
    #
    #
    #   if board[new_pos].is_a?(Piece) && board[new_pos].color != self.color
    #     return new_pos
    #   elsif board[new_pos].is_a?(Piece) && board[new_pos].color == self.color
    #     return []
    #   elsif !board.include?(new_pos)
    #     return []
    #   end
    # end
    #
    #
    #
    # moves += new_pos + self.grow_unblocked_moves_in_dir(dx, dy)
    #
    # moves


    moves
  end
end
