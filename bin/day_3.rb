# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'input/input_provider'
require 'days/day_3/report_parser'

raw_input = InputProvider.get_input_for_day(3)
Aoc.logger.info("Read #{raw_input.split.length} lines of input")

diagnostic_report = Day3::ReportParser.parse_input(raw_input)
result = diagnostic_report.gamma_rate * diagnostic_report.epsilon_rate
Aoc.logger.info("Product of Gamma * Epsilon: #{result}")
