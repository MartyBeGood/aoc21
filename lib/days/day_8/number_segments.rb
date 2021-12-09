# frozen_string_literal: true

module Day8
  class << self
    SEGMENT_SETS = [
      Set[:a, :b, :c, :e, :f, :g],
      Set[:c, :f],
      Set[:a, :c, :d, :e, :g],
      Set[:a, :c, :d, :f, :g],
      Set[:b, :c, :d, :f],
      Set[:a, :b, :d, :f, :g],
      Set[:a, :b, :d, :e, :f, :g],
      Set[:a, :c, :f],
      Set[:a, :b, :c, :d, :e, :f, :g],
      Set[:a, :b, :c, :d, :f, :g],
    ].freeze
  end
end
