# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'days/day_2/input_parser'
require 'days/day_2/submarine'

raw_input = InputProvider.get_input_for_day(2)
Aoc.logger.info("Read #{raw_input.split.length} lines of input")

commands = Day2.parse_input(raw_input)
Aoc.logger.info("Parsed into #{commands.length} commands")

sub = Day2::Submarine.new

sub.move(*commands)
Aoc.logger.info(
  "Submarine moved to Distance: #{sub.distance} and Depth: #{sub.depth}. Answer is #{sub.distance * sub.depth}"
)
