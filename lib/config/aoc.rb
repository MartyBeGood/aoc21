# frozen_string_literal: true

require 'ostruct'
require 'fileutils'

module Aoc
  class << self
    def configuration
      @configuration ||= OpenStruct.new
    end

    def configure
      yield(configuration)
      create_cache_dir_if_not_exist
    end

    def method_missing(method, *_args, &_block)
      raise 'Set config using Aoc.configure!' if method.to_s.end_with?('=')

      struct_value = configuration.public_send(method)

      raise ValueNotSetError, method if struct_value.nil?

      struct_value
    end

    def respond_to_missing?(method_name, *_args)
      !method_name.end_with?('=')
    end

    def create_cache_dir_if_not_exist
      return if !configuration.cache_dir || File.directory?(configuration.cache_dir)

      FileUtils.mkdir_p(configuration.cache_dir)
    end
  end

  class ConfigError < StandardError
  end

  class ValueNotSetError < ConfigError
    def initialize(value)
      super("Value '#{value}' not set in config!")
    end
  end
end
