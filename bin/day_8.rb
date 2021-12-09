# frozen_string_literal: true

require_relative '../load_paths'
require 'input/input_provider'
require 'config/default_config'
require 'days/day_8/input_parser'
require 'days/day_8/segment_solver'

parser = Day8::InputParser.new(InputProvider.get_input_for_day(8))
parser.parse

num_unique_digits = parser.outputs.reduce(0) do |total, line|
  total + line.map { |digit| [2, 3, 4, 7].include?(digit.length) ? 1 : 0 }.sum
end

Aoc.logger.info("Found #{num_unique_digits} unique digits (1, 4, 7 or 8)")

parser.signals.each_with_index do |signal, index|
  solver = Day8::SegmentSolver.new(signal)
  solver.solve
  solver.translate(parser.outputs[index])
end

#lengths:
# 0: 6
# 1: 2
# 2: 5
# 3: 5
# 4: 4
# 5: 5
# 6: 6
# 7: 3
# 8: 7
# 9: 6

# digits by length:
# 2: 1
# 3: 7
# 4: 4
# 5: 2, 3, 5
# 6: 6, 9, 0
# 7: 8

# unique combinations for the non-unique-length numbers:
# a = segs(7) - segs(1) -> easy
# g = segs(9) - segs(4) - a -> find the
# c = segs(9) - segs(5)
