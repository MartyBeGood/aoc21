# frozen_string_literal: true

require 'ostruct'
# Fancy config module (a.k.a the Singleton)
module Aoc
  class << self
    def configuration
      @configuration ||= OpenStruct.new
    end

    def configure
      yield(configuration)
    end
  end
end
