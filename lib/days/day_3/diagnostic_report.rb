# frozen_string_literal: true

module Day3
  class DiagnosticReport
    attr_reader :lines, :num_columns, :column_sums

    def initialize(lines)
      @lines = lines
      @num_columns = lines[0].length
      @column_sums = sum_up_columns
    end

    def most_common_bits
      (0..num_columns - 1).map { |ci| most_common_bit(ci) }
    end

    def least_common_bits
      (0..num_columns - 1).map { |ci| least_common_bit(ci) }
    end

    def gamma_rate
      binary_string = binary_string(most_common_bits)
      gamma_rate = Integer(binary_string, 2)
      Aoc.logger.info("Gamma rate is #{gamma_rate} (#{binary_string})")
      gamma_rate
    end

    def epsilon_rate
      binary_string = binary_string(least_common_bits)
      epsilon_rate = Integer(binary_string, 2)
      Aoc.logger.info("Gamma rate is #{epsilon_rate} (#{binary_string})")
      epsilon_rate
    end

    private

    def sanity_check_column(column)
      raise ArgumentError, "No column #{column} in this DiagnosticReport!" if column >= num_columns
    end

    def sum_up_columns
      (0..num_columns - 1).map do |ci|
        sum_up_column(ci)
      end
    end

    def sum_up_column(column_index)
      sanity_check_column(column_index)
      (0..lines.length - 1).map { |row_index| lines[row_index][column_index] }.sum
    end

    def most_common_bit(column_index)
      sanity_check_column(column_index)
      column_sums[column_index] > (lines.length / 2) ? 1 : 0
    end

    def least_common_bit(column_index)
      most_common_bit(column_index) == 1 ? 0 : 1
    end

    def binary_string(bits)
      bits.map(&:to_s).join
    end
  end
end
