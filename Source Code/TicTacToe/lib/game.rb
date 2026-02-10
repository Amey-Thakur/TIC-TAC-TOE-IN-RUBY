# frozen_string_literal: true

require_relative 'display'

# ==============================================================================
# Filename: game.rb
#
# Author: Amey Thakur (https://github.com/Amey-Thakur)
#         Mega Satish (https://github.com/msatmod)
#
# Repository: https://github.com/Amey-Thakur/TIC-TAC-TOE-IN-RUBY
# Release Date: 29 August 2022
# License: MIT
#
# Description:
# The `Game` class acts as the central orchestrator for the application.
# It initializes the game environment, manages the chronological flow of turns,
# facilitates player creation, and determines the final outcome (Win/Draw).
#
# Architecture:
# - Initialization: Boots the board and prepares player slots.
# - Game Loop: Cycles through turns until a terminal state is reached.
# - Input Handling: Routes user input through validation layers.
# - State Resolution: Evaluates the board after every move to check for game over.
# ==============================================================================

# Contains the logic to play the game
class Game
  include Display
  attr_reader :first_player, :second_player, :board, :current_player

  def initialize
    @board = Board.new
    @first_player = nil
    @second_player = nil
    @current_player = nil
  end

  # ============================================================================
  # Method: play
  # Description:
  # The primary execution pipeline. This method triggers the sequence of events:
  # 1. Setup (Player creation).
  # 2. Initial Board Render.
  # 3. The Gameplay Loop (Turns).
  # 4. Conclusion (Winner declaration).
  # ============================================================================
  def play
    game_set_up
    board.show
    player_turns
    conclusion
  end

  # Instantiates a new player object based on user input.
  # @param number [Integer] The player sequence number.
  # @param duplicate_symbol [String/Nil] The symbol to prohibit (if P2).
  # @return [Player] A new Player instance.
  def create_player(number, duplicate_symbol = nil)
    puts display_name_prompt(number)
    name = gets.chomp
    symbol = symbol_input(duplicate_symbol)
    Player.new(name, symbol)
  end

  # Executes a single turn for the specified player.
  # 1. Collects valid input.
  # 2. Updates the board state.
  # 3. Re-renders the interface.
  # @param player [Player] The player whose turn it is.
  def turn(player)
    cell = turn_input(player)
    board.update_board(cell - 1, player.symbol)
    board.show
  end

  private

  # Bootstrapping sequence to display intro and create both players.
  def game_set_up
    puts display_intro
    @first_player = create_player(1)
    @second_player = create_player(2, first_player.symbol)
  end

  # Recursive input loop for symbol selection.
  # Enforces single-character input and prevents duplication using Regex.
  # @param duplicate [String/Nil] The symbol to ban.
  # @return [String] A valid, unique symbol.
  def symbol_input(duplicate)
    player_symbol_prompts(duplicate)
    input = gets.chomp
    return input if input.match?(/^[^0-9]$/) && input != duplicate

    puts display_input_warning
    symbol_input(duplicate)
  end

  # Helper to display relevant prompts during symbol selection.
  def player_symbol_prompts(duplicate)
    puts display_symbol_prompt
    puts display_first_symbol(duplicate) if duplicate
  end

  # The main game loop.
  # Alternates control between players until a terminal condition (Win/Full) is met.
  def player_turns
    @current_player = first_player
    until board.full?
      turn(current_player)
      break if board.game_over?

      @current_player = switch_current_player
    end
  end

  # Recursive input loop for move selection.
  # Validates that the chosen cell (1-9) exists and is unoccupied.
  # @param player [Player] The current player.
  # @return [Integer] A valid cell reference.
  def turn_input(player)
    puts display_player_turn(player.name, player.symbol)
    number = gets.chomp.to_i
    return number if board.valid_move?(number)

    puts display_input_warning
    turn_input(player)
  end

  # Toggles the active player state.
  # @return [Player] The player who takes the next turn.
  def switch_current_player
    if current_player == first_player
      second_player
    else
      first_player
    end
  end

  # Final state handler.
  # Checks victory conditions one last time to display the correct legal outcome.
  def conclusion
    if board.game_over?
      puts display_winner(current_player.name)
    else
      puts display_tie
    end
  end
end
