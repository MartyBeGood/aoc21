# frozen_string_literal: true

require_relative '../load_paths'
require 'config/default_config'
require 'days/day_6'
require 'input/input_provider'

raw_input = InputProvider.get_input_for_day(6)

school = Day6::School.new(raw_input.split(',').map { |part| Integer(part) })
num_days = 256

num_days.times do
  school.tick
end

Aoc.logger.info("There are #{school.num_fish} fish after #{num_days} days")
