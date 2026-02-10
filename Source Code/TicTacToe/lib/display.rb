# frozen_string_literal: true

# ==============================================================================
# Filename: display.rb
#
# Author: Amey Thakur (https://github.com/Amey-Thakur)
#         Mega Satish (https://github.com/msatmod)
#
# Repository: https://github.com/Amey-Thakur/TIC-TAC-TOE-IN-RUBY
# Release Date: 29 August 2022
# License: MIT
#
# Description:
# The `Display` module serves as the centralized interface for Human-Machine
# Interaction (HMI). It handles all text-based output, including game prompts,
# state updates, and color-coded alerts, ensuring a consistent and polished
# Command Line Interface (CLI) experience.
# ==============================================================================

# rubocop:disable Layout/LineLength

# Module for Tic-Tac-Toe display logic
module Display
  # Introduction message welcoming the user to the simulation.
  def display_intro
    "Let's play a simple Tic-Tac-Toe game in the console! \n\n"
  end

  # Prompts for player identification to personalize the experience.
  # @param number [Integer] The sequential identifier of the player (1 or 2).
  def display_name_prompt(number)
    "What is the name of player ##{number}?"
  end

  # Requests the user to select a unique game marker (single character).
  def display_symbol_prompt
    'What 1 letter (or special character) would you like to be your game marker?'
  end

  # Alert message preventing duplicate symbol selection.
  # @param duplicate [String] The symbol already claimed by the opponent.
  def display_first_symbol(duplicate)
    "It can not be '#{duplicate}'"
  end

  # Warning message for invalid input events (e.g., occupied cell, regex mismatch).
  # Uses ANSI escape codes (\e[31m) to render text in red for immediate visual feedback.
  def display_input_warning
    "\e[31mSorry, that is an invalid answer. Please, try again.\e[0m"
  end

  # Standard turn prompt requesting a move coordinate.
  # @param name [String] The current player's identifier.
  # @param symbol [String] The current player's marker.
  def display_player_turn(name, symbol)
    "#{name}, please enter a number (1-9) that is available to place an '#{symbol}'"
  end

  # Victory announcement declaring the game winner.
  # @param player [String] The name of the victorious player.
  def display_winner(player)
    "GAME OVER! #{player} is the winner!"
  end

  # Declaration of a draw state when no moves remain.
  def display_tie
    "It's a draw"
  end
end
# rubocop:enable Layout/LineLength
