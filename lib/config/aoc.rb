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

    def method_missing(method, *_args, &_block)
      raise 'Set config using Aoc.configure!' if method.to_s.end_with?('=')

      configuration.public_send(method)
    end

    def respond_to_missing?(method_name, *_args)
      !method_name.end_with?('=')
    end
  end

end
