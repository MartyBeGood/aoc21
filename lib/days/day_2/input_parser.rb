# frozen_string_literal: true

require 'days/day_2/move_command'

module Day2
  class << self
    def parse_input(input)
      input.split("\n").map(&:split).map { |element| MoveCommand.new(element[0].to_sym, Integer(element[1])) }
    end
  end
end
