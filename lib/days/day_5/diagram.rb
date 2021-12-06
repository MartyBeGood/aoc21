# frozen_string_literal: true

require 'days/day_5/line'

module Day5
  class Diagram
    attr_reader :fields

    def initialize(size_x, size_y)
      @fields = Array.new(size_x)
      size_x.times do |row_index|
        @fields[row_index] = Array.new(size_y, 0)
        @size_x = size_x
        @size_y = size_y
      end
    end

    def draw(line)
      return unless line.drawable?

      Aoc.logger.debug("Drawing #{line}")
      line.all_points.each do |point|
        mark(point)
      end
    end

    def value_at(x, y)
      @fields[x][y]
    end

    def mark(point)
      @fields[point.x][point.y] += 1
    end

    def overlap_count
      count = 0

      @fields.each do |row|
        row.each do |value|
          count += 1 if value > 1
        end
      end

      count
    end
  end
end
