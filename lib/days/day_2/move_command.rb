# frozen_string_literal: true

module Day2
  class MoveCommand
    attr_reader :direction, :distance

    def initialize(direction, distance)
      @distance = distance
      case direction
      when :up, :down, :forward
        @direction = direction
      else
        raise InvalidDirection, "#{direction} isn't a valid direction for a MoveCommand"
      end
    end

    def ==(other)
      direction == other.direction && distance == other.distance
    end
  end

  class InvalidDirection < ArgumentError
  end
end
