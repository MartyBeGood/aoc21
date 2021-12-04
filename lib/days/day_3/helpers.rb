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

      def sum_up_column(lines, column_index)
        (0..lines.length - 1).map { |row_index| lines[row_index][column_index] }.sum
      end

      def most_common_bit(lines, column_index)
        sum_up_column(lines, column_index) > (lines.length / 2) ? 1 : 0
      end

      def least_common_bit(lines, column_index)
        most_common_bit(lines, column_index) == 1 ? 0 : 1
      end

      def bits_to_number(bits)
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
  end
end
