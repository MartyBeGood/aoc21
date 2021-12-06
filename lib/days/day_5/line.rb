# frozen_string_literal: true

require 'days/day_5/point'

module Day5
  class NotDrawableError < StandardError; end

  class Line
    attr_reader :start_point, :end_point

    def initialize(start_point, end_point)
      @start_point = start_point
      @end_point = end_point
    end

    def drawable?
      horizontal? || vertical?
    end

    def horizontal?
      start_point.x == end_point.x
    end

    def vertical?
      start_point.y == end_point.y
    end

    def all_points
      if horizontal?
        start_x = start_point.x
        start_y = [start_point.y, end_point.y].min
        end_y = [start_point.y, end_point.y].max
        (start_y..end_y).map { |y| Point.new(start_x, y) }
      elsif vertical?
        start_y = start_point.y
        start_x = [start_point.x, end_point.x].min
        end_x = [start_point.x, end_point.x].max
        (start_x..end_x).map { |x| Point.new(x, start_y) }
      else
        raise NotDrawableError, "Line #{self} is not drawable"
      end
    end

    def to_s
      "#{start_point} -> #{end_point}"
    end
  end
end
