# frozen_string_literal: true

module Day2
  class Submarine
    attr_reader :distance, :depth

    def initialize
      @distance = 0
      @depth = 0
    end

    def move(*commands)
      commands.each do |command|
        case command.direction
        when :down
          sink(command.distance)
        when :up
          rise(command.distance)
        when :forward
          propel(command.distance)
        end
      end
    end

    private

    def sink(depth)
      @depth += depth
    end

    def rise(depth)
      @depth = [self.depth - depth, 0].max
    end

    def propel(distance)
      @distance += distance
    end
  end
end
