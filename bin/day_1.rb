# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'days/day_1'

raw_input = InputProvider.get_input_for_day(1)
readings = Day1.parse_input(raw_input)
Aoc.logger.info("Read #{readings.length} depth readings")

increases = Day1.count_increases(readings)
Aoc.logger.info("Found #{increases} depth increases")

window_length = 3
sliding_sum_increases = Day1.count_increases(Day1.sliding_sums(readings, window_length))
Aoc.logger.info("Found #{sliding_sum_increases} when comparing sliding windows of length #{window_length}")

# Input = one depth measurement per line
# Task = Count number of times depth measurement increases
