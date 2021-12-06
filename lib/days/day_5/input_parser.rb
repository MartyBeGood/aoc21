# frozen_string_literal: true

module Day5
  module Input
    class << self
      def line_to_coordinate_pair(line)
        line.split(' -> ') # ["1,2", "3,4"]
            .map { |half| half.split(',') } # [["1", "2"], ["3", "4"]]
            .map { |pair| pair.map { |elem| Integer(elem) } } # [[1, 2], [3, 4]]
      end
    end

    class Parser
      attr_accessor :coordinate_pairs, :max_x, :max_y
      def initialize(input)
        lines = input.strip.split("\n")
        @coordinate_pairs = []
        @max_x = 0
        @max_y = 0
        lines.each do |line|
          pair = Input.line_to_coordinate_pair(line)
          pair.each do |point|
            @max_x = [@max_x, point[0]].max
            @max_y = [@max_y, point[1]].max
          end
          @coordinate_pairs.push(pair)
        end
      end
    end
  end
end
