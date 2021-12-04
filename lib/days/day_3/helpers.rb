# frozen_string_literal: true

module Day3
  module Helpers
    class << self
      def most_common_bits(lines)
        on_all_columns(lines) { |ci| most_common_bit(lines, ci) }
      end

      def least_common_bits(lines)
        on_all_columns(lines) { |ci| least_common_bit(lines, ci) }
      end

      def gamma_rate(lines)
        bits_to_number(most_common_bits(lines))
      end

      def epsilon_rate(lines)
        bits_to_number(least_common_bits(lines))
      end

      def select_by_bit(lines, column, value)
        lines.select { |line| line[column] == value }
      end

      def oxygen_generator_rating_line(lines)
        iterative_filter(lines, :most_common_bit, 1)
      end

      def oxygen_generator_rating(lines)
        bits_to_number(oxygen_generator_rating_line(lines))
      end

      def co2_scrubber_rating_line(lines)
        iterative_filter(lines, :least_common_bit, 0)
      end

      def co2_scrubber_rating(lines)
        bits_to_number(co2_scrubber_rating_line(lines))
      end

      def iterative_filter(lines, function, tie_breaker)
        mylines = lines

        (0..max_index(mylines)).each do |ci|
          begin
            target_bit = Day3::Helpers.send(function, mylines, ci)
          rescue TieError
            target_bit = tie_breaker
          end
          mylines = select_by_bit(mylines, ci, target_bit)
          break if mylines.length <= 1
        end
        raise StandardError, 'Could not find a matching line!' if mylines.length.zero?

        selected = select_by_bit(mylines, tied_at_column, tie_breaker)[0] if mylines.length == 2
        selected || mylines[0]
      end

      def sum_up_column(lines, column_index)
        (0..lines.length - 1).map { |row_index| lines[row_index][column_index] }.sum
      end

      def most_common_bit(lines, column_index)
        sum = sum_up_column(lines, column_index)
        half = (lines.length / 2)
        raise TieError if (sum == half) && lines.length.even?

        sum > half ? 1 : 0
      end

      def least_common_bit(lines, column_index)
        most_common_bit(lines, column_index) == 1 ? 0 : 1
      end

      def bits_to_number(bits)
        Aoc.logger.debug("Converting #{bits} to integer")
        Integer(binary_string(bits), 2)
      end

      def binary_string(bits)
        bits.map(&:to_s).join
      end

      def num_columns(lines)
        lines[0].length
      end

      def max_index(lines)
        num_columns(lines) - 1
      end

      def on_all_columns(lines, &block)
        (0..max_index(lines)).map(&block)
      end
    end

    class TieError < ArgumentError
    end
  end
end
