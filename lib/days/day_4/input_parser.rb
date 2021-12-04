# frozen_string_literal: true

require 'stringio'

module Day4
  module Input
    class << self
      def sequence_line_to_int_array(line)
        line.split(',').map { |part| Integer(part) }
      end

      def board_line_to_int_array(line)
        line.gsub(/ +/, ' ').split(' ').map { |part| Integer(part) }
      end

      def split_into_blocks(input)
        input.split("\n\n").map(&:strip)
      end

      def block_to_board_array(block)
        block.split("\n").map do |line|
          board_line_to_int_array(line)
        end
      end
    end
    class Parser
      attr_reader :sequence, :boards
      def read(input)
        blocks = Input.split_into_blocks(input)
        @sequence = Input.sequence_line_to_int_array(blocks[0])
        @boards = blocks.slice(1..blocks.length - 1).map do |block|
          Input.block_to_board_array(block)
        end
      end
    end
  end
end
