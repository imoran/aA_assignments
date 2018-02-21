require_relative 'board'
require_relative 'cursor'
require 'colorize'
require "byebug"

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def cursor_square?(pos)
    return true if cursor.cursor_pos == board[pos]
    false
  end

  def render
    all_rows = []
    board.grid.each_index do |row|
      new_row = []
      board.grid.each_index do |col|
        pos = [row, col]
        if pos == cursor.cursor_pos
          new_row << ("#{board[cursor.cursor_pos].piece_emoji}").colorize(:color => :green, :background => :light_cyan)
        elsif pos == cursor.selected
          new_row << ("#{board[cursor.selected].piece_emoji}").colorize(:red)
        elsif (row + col).even?
          new_row << ("#{board[pos].piece_emoji}").colorize(:color => :black, :background => :light_black)
        else
          new_row <<("#{board[pos].piece_emoji}").colorize(:color => :yellow, :background => :light_yellow)
        end
      end

      all_rows << "\n" + new_row.join + "\n"
    end

    print all_rows.join
  end

  def display
    loop do
      render
      cursor.get_input
      system("clear")
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  display = Display.new(Board.new)
  display.display
end
