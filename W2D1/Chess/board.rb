require_relative "piece"
require_relative "start_pos"
require "byebug"


class Board
  include Moveable
  attr_accessor :grid

  def self.fresh_board
    Array.new(8) { Array.new(8) }
  end

  def initialize
    @grid = self.class.fresh_board

  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def populate
    @grid.each_index do |row|
      @grid.each_index do |column|
        pos = row, column
        if Moveable::STARTING_POS.include?(pos)
          @grid[row][column] = Piece.new
        end
      end
    end
  end


  def move_piece(start_pos, end_pos)
    raise MoveError if self[start_pos].nil?
  end

  def valid_move?(pos)
    @grid[pos]
  end

end

class NoStartError < StandardError
  def message
    "There is nothing here. Sorry ):"
  end
end

class MoveError < StandardError
  def message
    "You can't sit with us!"
  end
end
