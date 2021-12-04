# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'days/day_4/input_parser'
require 'days/day_4/game'

Aoc.logger.level = Logger::INFO
parser = Day4::Input::Parser.new(InputProvider.get_input_for_day(4))

game = Day4::Game.new(parser.boards.map { |numbers| Day4::Board.new(numbers) }, parser.sequence)

found_winners = {}

WinnerInfo = Struct.new(:board, :won_with_call)

while game.steps_left?
  game.step

  winners = game.find_winners
  winners.each do |w|
    unless found_winners.key?(w)
      found_winners[w] =
        WinnerInfo.new(Marshal.load(Marshal.dump(game.boards[w])), game.last_number_called)
    end
  end
end

last_index_to_win = found_winners.keys[-1]
winner = found_winners[last_index_to_win]

Aoc.logger.info("Found last winner in board: #{last_index_to_win} after #{game.rounds_played} rounds played")

board_score = winner.board.score
last_number = winner.won_with_call
final_score = board_score * last_number

Aoc.logger.info(
  "Last winning board score is #{board_score}. Last number called was #{last_number}. Final score: #{final_score}"
)
