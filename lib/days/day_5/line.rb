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
      horizontal? || vertical? || diagonal?
    end

    def horizontal?
      start_point.x == end_point.x
    end

    def vertical?
      start_point.y == end_point.y
    end

    def diagonal?
      horizontal_difference = (end_point.x - start_point.x).abs
      vertical_difference = (end_point.y - start_point.y).abs
      horizontal_difference == vertical_difference
    end

    def all_points
      start_x = [start_point.x, end_point.x].min
      if horizontal?
        start_y = [start_point.y, end_point.y].min
        end_y = [start_point.y, end_point.y].max
        (start_y..end_y).map { |y| Point.new(start_x, y) }
      elsif vertical?
        start_y = start_point.y
        end_x = [start_point.x, end_point.x].max
        (start_x..end_x).map { |x| Point.new(x, start_y) }
      elsif diagonal?
        pstart = [start_point, end_point].select { |point| point.x == start_x }[0]
        pend = [start_point, end_point].reject { |point| point.x == start_x }[0]
        # pend.x should be larger than pstart.x
        y_direction = (pend.y - pstart.y) / (pend.x - pstart.x) # is either 1 or -1
        num_points = (pend.x - pstart.x)
        (0..num_points).map do |i|
          Point.new(pstart.x + i, (pstart.y + (i * y_direction)))
        end
      else
        raise NotDrawableError, "Line #{self} is not drawable"
      end
    end

    def to_s
      "#{start_point} -> #{end_point}"
    end
  end
end
