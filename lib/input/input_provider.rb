# frozen_string_literal: true

require 'config/aoc'

# Get Input for a given day of Advent of Code 2021
module InputProvider
  class << self
    def get_input_for_day(day)
      raise InputNotFound, "Can't get input for #{day}"
    end
  end

  class InputNotFound < StandardError
  end
end
