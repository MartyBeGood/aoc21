# frozen_string_literal: true

require 'ostruct'
require 'fileutils'
# Fancy config module (a.k.a the Singleton)
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

      configuration.public_send(method)
    end

    def respond_to_missing?(method_name, *_args)
      !method_name.end_with?('=')
    end

    def create_cache_dir_if_not_exist
      return if File.directory?(configuration.cache_dir)

      FileUtils.mkdir_p(configuration.cache_dir)
    end
  end
end
