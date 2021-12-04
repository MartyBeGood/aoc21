# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'days/day_3/report_parser'

raw_input = InputProvider.get_input_for_day(3)
Aoc.logger.info("Read #{raw_input.split.length} lines of input")

diagnostic_report = Day3::ReportParser.parse_input(raw_input)
result1 = diagnostic_report.gamma_rate * diagnostic_report.epsilon_rate
Aoc.logger.info("Product of Gamma * Epsilon: #{result1}")

o2 = diagnostic_report.oxygen_generator_rating
co2 = diagnostic_report.co2_scrubber_rating
Aoc.logger.info("O2 generator rating: #{o2}, Co2 scrubber rating: #{co2}")
result2 = o2 * co2
Aoc.logger.info("Product of O2 * Co2: #{result2}")
