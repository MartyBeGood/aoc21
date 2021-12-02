# frozen_string_literal: true

require('config/aoc')
require('logger')

Aoc.configure do |config|
  config.cache_dir_path = Pathname.new(Dir.pwd).join('cache')
  config.logger = Logger.new($stdout)
end
