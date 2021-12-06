# frozen_string_literal: true

module Day5
  class Point
    attr_accessor :x, :y

    def initialize(x, y)
      self.x = x
      self.y = y
    end

    def to_s
      "(#{x}, #{y})"
    end

    def ==(other)
      other.x == x && other.y == y
    end
  end
end
