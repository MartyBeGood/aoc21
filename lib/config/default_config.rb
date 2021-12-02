# frozen_string_literal: true

require 'config/aoc'
require 'logger'

Aoc.configure do |config|
  config.cache_dir = File.join(Dir.pwd, 'cache')
  config.logger = Logger.new($stdout)
end
