# frozen_string_literal: true

# ==============================================================================
# Filename: main.rb
#
# Author: Amey Thakur (https://github.com/Amey-Thakur)
#         Mega Satish (https://github.com/msatmod)
#
# Repository: https://github.com/Amey-Thakur/TIC-TAC-TOE-IN-RUBY
# Release Date: 29 August 2022
# License: MIT
#
# Description:
# The entry point for the Tic-Tac-Toe application. This script bootstraps the
# game environment by loading necessary dependencies and initiating the primary
# gameplay loop. It also handles the replay mechanism, allowing users to start
# new matches without restarting the program.
# ==============================================================================

require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'display'

# Initiates a single game session.
# Creates a new Game instance and triggers the play sequence.
def play_game
  game = Game.new
  game.play
  repeat_game
end

# Handles the post-game interaction flow.
# Prompts the user to replay or exit the application.
def repeat_game
  puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
  repeat_input = gets.chomp.downcase
  if repeat_input == 'y'
    play_game
  else
    puts 'Thanks for playing!'
  end
end

# Application Entry Point
play_game
