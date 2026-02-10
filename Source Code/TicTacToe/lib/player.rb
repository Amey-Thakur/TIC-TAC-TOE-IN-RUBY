# frozen_string_literal: true

# ==============================================================================
# Filename: player.rb
#
# Author: Amey Thakur (https://github.com/Amey-Thakur)
#         Mega Satish (https://github.com/msatmod)
#
# Repository: https://github.com/Amey-Thakur/TIC-TAC-TOE-IN-RUBY
# Release Date: 29 August 2022
# License: MIT
#
# Description:
# The `Player` class is a lightweight data structure representing a participant
# in the game. It encapsulates the user's identity (name) and their chosen
# game marker (symbol), ensuring consistent state tracking throughout the match.
# ==============================================================================

# Game need two players
class Player
  attr_reader :name, :symbol

  # Initializes a new player entity.
  # @param name [String] The display name of the player.
  # @param symbol [String] The unique single-character marker for the board.
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
