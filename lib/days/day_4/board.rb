# frozen_string_literal: true

module Day4
  # holds a x-long array of x-long arrays of numbers
  # and another same-sized array for marking them
  class Board
    attr_reader :markings, :numbers

    def initialize(numbers)
      @numbers = numbers
      @markings = build_marked_array(board_size)
    end

    def call(number)
      hit_count = 0
      on_every_cell do |row, col|
        if numbers[row][col] == number
          @markings[row][col] = true
          hit_count += 1
        end
      end
      hit_count
    end

    # Score = sum of all unmarked numbers
    def score
      score = 0
      on_every_cell do |row, col|
        score += numbers[row][col] unless markings[row][col]
      end
      score
    end

    def won?
      full_column? || full_row?
    end

    def full_row?
      index_range.reduce(false) { |has_full_row, row_index| has_full_row || row_is_full(row_index) }
    end

    def full_column?
      index_range.reduce(false) { |has_full_col, col_index| has_full_col || column_is_full(col_index) }
    end

    def board_size
      numbers.length
    end

    private

    def build_marked_array(size)
      arr = Array.new(size)
      size.times do |i|
        arr[i] = Array.new(size, false)
      end
      arr
    end

    def row_is_full(row_index)
      markings[row_index].reduce(true) { |full, value| full && value }
    end

    def column_is_full(column_index)
      markings.reduce(true) { |full, row| full && row[column_index] }
    end

    def on_every_cell
      on_each_index do |row|
        on_each_index do |col|
          yield(row, col)
        end
      end
    end

    def on_each_index(&block)
      index_range.each(&block)
    end

    def index_range
      (0..board_size - 1)
    end
  end
end
