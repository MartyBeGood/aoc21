# frozen_string_literal: true

module Day6
  class School
    attr_reader :fish_array

    def initialize(fish_array)
      @fish_array = Array.new(9, 0)
      fish_array.each do |value|
        @fish_array[value] += 1
      end
    end

    def tick
      new_array = [
        @fish_array[1],                      # 0
        @fish_array[2],                      # 1
        @fish_array[3],                      # 2
        @fish_array[4],                      # 3
        @fish_array[5],                      # 4
        @fish_array[6], # 5
        @fish_array[7] + @fish_array[0], # 6
        @fish_array[8],                      # 7
        @fish_array[0]                       # 8
      ]
      @fish_array = new_array
    end

    def num_fish
      @fish_array.sum
    end
  end
end
