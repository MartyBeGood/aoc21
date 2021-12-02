# frozen_string_literal: true

require_relative('../load_paths')
require('config/default_config')
require('input/input_provider')

module Day1
  class << self
    def count_increases(input_array)
      counter = 0
      previous = nil
      input_array.each do |current|
        counter += 1 if !previous.nil? && current > previous
        previous = current
      end
      counter
    end

    def parse_input(input)
      input.split.map { |line| Integer(line) }
    end

    def sliding_sums(input, window_length)
      # zero-indexed fun
      start_index = window_length - 1
      end_index = input.length - 1
      result_array = []
      (start_index..end_index).each do |i|
        sum = 0
        (0..window_length-1).each do |prev|
          sum += input[i - prev]
        end
        result_array.push(sum)
      end
      result_array
    end
  end
end
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
