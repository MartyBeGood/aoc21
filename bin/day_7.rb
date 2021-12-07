# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'benchmark'

raw_input = InputProvider.get_input_for_day(7)

crabs = raw_input.split(',').map { |part| Integer(part) }

min, max = crabs.minmax

def fuel_needed(distance)
  (1..distance).reduce(0, :+)
end

fuel_needed_by_position = {}
time = Benchmark.measure do
  fuel_needed_by_position = (min..max).map do |pos|
    [pos, crabs.reduce(0) { |fuel, crab| fuel + (pos - crab).abs }]
  end.to_h
end

min_fuel_needed = fuel_needed_by_position.values.min
min_fuel_position = fuel_needed_by_position.invert[min_fuel_needed]

Aoc.logger.info(
  "Part1: Minimum fuel needed: #{min_fuel_needed} when aligning at #{min_fuel_position} (calculated in #{time.real})"
)

time = Benchmark.measure do
  fuel_needed_by_position = (min..max).map do |pos|
    [pos, crabs.reduce(0) { |fuel, crab| fuel + fuel_needed((pos - crab).abs) }]
  end.to_h
end

min_fuel_needed = fuel_needed_by_position.values.min
min_fuel_position = fuel_needed_by_position.invert[min_fuel_needed]
Aoc.logger.info(
  "Part2: Minimum fuel needed: #{min_fuel_needed} when aligning at #{min_fuel_position} (calculated in #{time.real})"
)
