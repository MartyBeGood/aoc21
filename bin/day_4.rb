# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'days/day_4/input_parser'
require 'days/day_4/game'

Aoc.logger.level = Logger::INFO
parser = Day4::Input::Parser.new(InputProvider.get_input_for_day(4))

game = Day4::Game.new(parser.boards.map { |numbers| Day4::Board.new(numbers) }, parser.sequence)

game.step while game.find_winners.empty?

winners = game.find_winners

exit(2) if winners.length > 1

winner = winners[0]

Aoc.logger.info("Found winner in board: #{winner} after #{game.rounds_played} rounds played")

board_score = game.boards[winner].score
last_number = game.last_number_called
final_score = board_score * last_number

Aoc.logger.info(
  "Winning board score is #{board_score}. Last number called was #{last_number}. Final score: #{final_score}"
)
