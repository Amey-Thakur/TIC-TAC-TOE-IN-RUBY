# frozen_string_literal: true

# ==============================================================================
# Filename: board.rb
#
# Author: Amey Thakur (https://github.com/Amey-Thakur)
#         Mega Satish (https://github.com/msatmod)
#
# Repository: https://github.com/Amey-Thakur/TIC-TAC-TOE-IN-RUBY
# Release Date: 29 August 2022
# License: MIT
#
# Description:
# The `Board` class serves as the state engine for the Tic-Tac-Toe game.
# It encapsulates the 3x3 grid data structure, manages cell updates, and
# implements strict validation logic for move legality and victory conditions.
#
# Key Responsibilities:
# - Grid Maintenance: Initializes and tracks the state of 9 distinct cells.
# - Visualization: Renders a real-time ASCII representation of the board.
# - Validation: Dynamic checks for move validity (occupied vs. free cells).
# - Logic Verification: Algorithmic detection of win states and draw conditions.
# ==============================================================================

# Tic-Tac-Toe Board
class Board
  attr_reader :cells

  # Predefined winning combinations based on grid indices (0-8).
  # These arrays represent the linear paths (rows, columns, diagonals) required for victory.
  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical Columns
    [0, 4, 8], [2, 4, 6]             # Diagonal Axes
  ].freeze

  # Initializes the board state with numeric placeholders (1-9).
  # These integers facilitate user selection during the gameplay phase.
  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # ============================================================================
  # Method: show
  # Description:
  # Renders the current state of the board to the standard output.
  # Utilizes a HEREDOC for clean, tabular visualization of the 3x3 grid.
  # ============================================================================
  # rubocop:disable Metrics/AbcSize
  def show
    puts <<-HEREDOC

       #{cells[0]} | #{cells[1]} | #{cells[2]}
      ---+---+---
       #{cells[3]} | #{cells[4]} | #{cells[5]}
      ---+---+---
       #{cells[6]} | #{cells[7]} | #{cells[8]}

    HEREDOC
  end
  # rubocop:enable Metrics/AbcSize

  # Updates a specific cell with the player's symbol.
  # @param number [Integer] The 0-indexed position to update.
  # @param symbol [String] The player's marker (e.g., 'X', 'O').
  def update_board(number, symbol)
    @cells[number] = symbol
  end

  # Validates if a chosen move is legal.
  # A move is considered valid if the target cell still contains its
  # initial numeric placeholder, indicating it has not yet been claimed.
  #
  # @param number [Integer] The 1-indexed cell reference from user input.
  # @return [Boolean] True if the cell is available, False otherwise.
  def valid_move?(number)
    cells[number - 1] == number
  end

  # Checks if the board is completely filled (Draw condition).
  # Iterates through all cells to verify if any numeric placeholders remain.
  #
  # @return [Boolean] True if no numeric cells exist (all are symbols).
  def full?
    cells.all? { |cell| cell.to_s =~ /[^0-9]/ }
  end

  # Determines if a win condition has been met.
  # Scours the board against `WINNING_COMBOS` to see if any line
  # is occupied by a single unique symbol (Player X or Player O).
  #
  # @return [Boolean] True if a winning line is detected.
  def game_over?
    WINNING_COMBOS.any? do |combo|
      [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
    end
  end
end
