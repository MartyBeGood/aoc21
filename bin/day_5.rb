# frozen_string_literal: true

require_relative '../load_paths'
require 'days/day_5/diagram'
require 'days/day_5/input_parser'
require 'config/default_config'
require 'input/input_provider'

raw_input = InputProvider.get_input_for_day(5)

parser = Day5::Input::Parser.new(raw_input)

diag = Day5::Diagram.new(parser.max_x + 1, parser.max_y + 1)

parser.coordinate_pairs.each do |pair|
  line = Day5::Line.new(Day5::Point.new(*pair[0]), Day5::Point.new(*pair[1]))
  diag.draw(line)
end

overlaps = diag.overlap_count
Aoc.logger.info("Found #{overlaps} overlaps")
