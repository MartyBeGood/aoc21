# frozen_string_literal: true

require 'config/aoc'

module Day8
  class SegmentSolver
    attr_reader :signal_for

    def initialize(inputs)
      @inputs = inputs.map(&:chars).map(&:to_set)
      @segments_map = {}
      @signal_for = {
        1 => find_one,
        4 => find_four,
        7 => find_seven,
        8 => find_eight
      }
    end

    def solve
      @segments_map[:a] = (@signal_for[7] - @signal_for[1])
      solve_nine_and_g
      @segments_map[:e] = (@signal_for[8] - @signal_for[9])
      solve_six_and_zero
      # we have 0, 1, 4, 6, 7, 8, 9
      # 2, 3, 5 to go (all length 5)
      @signal_for[5] = @signal_for[6] - @segments_map[:e]
      solve_two_and_three
      self
    end

    def translate(numbers)
      results = numbers.map do |number|
        number_set = number.chars.to_set
        @signal_for.key(number_set)
      end
      Aoc.logger.info("#{numbers} translate to #{results}")
      results
    end

    def solve_two_and_three
      candidates = signals_of_length(5).reject { |signal| signal == @signal_for[5] }
      @signal_for[3] = candidates.find do |signal|
        !signal.intersect?(@segments_map[:e])
      end
      @signal_for[2] = candidates.find do |signal|
        signal.intersect?(@segments_map[:e])
      end
    end

    def solve_nine_and_g
      known = @signal_for[4] + signal_for[7]
      signals_of_length(6).each do |signal|
        diff = signal - known
        next unless diff.length == 1

        @segments_map[:g] = diff
        @signal_for[9] = signal
      end
    end

    def solve_six_and_zero
      candidates = signals_of_length(6).reject { |signal| signal == @signal_for[7] }
      @signal_for[0] = candidates.find { |candidate| @signal_for[7] < candidate }
      @signal_for[6] = candidates.find { |candidate| candidate != @signal_for[0] }
    end

    def find_one
      @inputs.find { |candidate| candidate.size == 2 }
    end

    def find_seven
      @inputs.find { |candidate| candidate.size == 3 }
    end

    def find_four
      @inputs.find { |candidate| candidate.size == 4 }
    end

    def find_eight
      @inputs.find { |candidate| candidate.size == 7 }
    end

    def signals_of_length(length)
      @inputs.select { |word| word.size == length }
    end
  end
end
