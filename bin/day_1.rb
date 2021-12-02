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
  end
end
raw_input = InputProvider.get_input_for_day(1)
readings = Day1.parse_input(raw_input)
Aoc.logger.info("Read #{readings.length} depth readings")

increases = Day1.count_increases(readings)
Aoc.logger.info("Found #{increases} depth increases")

# Input = one depth measurement per line
# Task = Count number of times depth measurement increases
