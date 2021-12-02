# frozen_string_literal: true

module Day2
  class Submarine
    attr_reader :distance, :depth, :aim

    def initialize
      @distance = 0
      @depth = 0
      @aim = 0
    end

    def move(*commands)
      commands.each do |command|
        case command.direction
        when :down
          aim_down(command.distance)
        when :up
          aim_up(command.distance)
        when :forward
          propel(command.distance)
        end
      end
    end

    private

    def aim_up(amount)
      @aim -= amount
    end

    def aim_down(amount)
      @aim += amount
    end

    def propel(distance)
      @distance += distance
      new_depth = depth + aim * distance
      @depth = [0, new_depth].max
    end
  end
end
