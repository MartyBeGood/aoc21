# frozen_string_literal: true

require 'config/aoc'

# Get Input for a given day of Advent of Code 2021
module InputProvider
  class << self
    def get_input_for_day(day)
      begin
        file = find_file_locally(day)
        file.read
      rescue Errno::ENOENT
        raise InputNotFound, "Can't get input for #{day}"
      end

    end

    private

    def find_file_locally(day)
      filepath = File.join(Aoc.cache_dir, "#{day}.txt")
      File.open(filepath)
    end
  end

  class InputNotFound < StandardError
  end
end
