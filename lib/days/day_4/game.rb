# frozen_string_literal: true

require 'config/aoc'
require 'days/day_4/board'

module Day4
  class Game
    attr_reader :boards, :sequence

    def initialize(boards, sequence)
      @boards = boards
      @sequence = sequence
      @next_index_to_call = 0
    end

    def step
      call(sequence[@next_index_to_call])
      @next_index_to_call += 1
    end

    def find_winners
      winners = []
      boards.each_with_index do |board, i|
        winners.push(i) if board.won?
      end
      winners
    end

    def rounds_played
      next_index_to_call
    end

    private

    def call(number)
      Aoc.logger.info("Calling number #{number}")
      boards.each_with_index do |board, i|
        fields_hit = board.call(number)
        Aoc.logger.info("Board #{i} has marked #{fields_hit} fields") if fields_hit.positive?
      end
    end
  end
end
