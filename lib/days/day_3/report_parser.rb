# frozen_string_literal: true
require 'days/day_3/diagnostic_report'

module Day3
  class ReportParser
    class << self
      def parse_input(input_string)
        lines = input_string.split
        verify_same_lengths(*lines)
        verify_binary_strings(*lines)
        DiagnosticReport.new(break_into_int_arrays(*lines))
      end

      def verify_same_lengths(*lines)
        initial_length = lines[0].length
        lines.slice(1, lines.length).each do |l|
          next if l.length == initial_length

          raise ArgumentError, 'Input contains string with non-matching length!'
        end
      end

      def verify_binary_strings(*lines)
        lines.each do |line|
          raise ArgumentError, "Line #{line} is not a binary string" unless Integer(line, 2)
        end
      end

      def break_into_int_arrays(*lines)
        lines.map { |line| line.chars.map { |character| Integer(character, 10) } }
      end
    end
  end
end
