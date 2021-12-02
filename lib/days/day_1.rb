# frozen_string_literal: true

module Day1
  class << self
    def count_increases(input_array)
      counter = 0
      previous = nil
      input_array.each do |current|
        counter += 1 if !previous.nil? && current > previous
        previous = current
      end
      counter
    end

    def parse_input(input)
      input.split.map { |line| Integer(line) }
    end

    def sliding_sums(input, window_length)
      # zero-indexed fun
      start_index = window_length - 1
      end_index = input.length - 1
      result_array = []
      (start_index..end_index).each do |i|
        sum = 0
        (0..window_length - 1).each do |prev|
          sum += input[i - prev]
        end
        result_array.push(sum)
      end
      result_array
    end
  end
end
