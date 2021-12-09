# frozen_string_literal: true

module Day8
  class InputParser
    attr_reader :signals, :outputs

    def initialize(input)
      @raw = input
      @signals = []
      @outputs = []
      @parsed = false
    end

    def parse
      return if @parsed

      @raw.split("\n").each do |line|
        parts = line.strip.split('|').map(&:strip)
        @signals.push(parts[0].split.map { |thing| sanitize(thing)})
        @outputs.push(parts[1].split.map { |thing| sanitize(thing)})
      end
      self
    end

    def sanitize(string)
      string.strip.chars.sort.join
    end
  end
end
