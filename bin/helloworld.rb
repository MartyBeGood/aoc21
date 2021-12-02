# frozen_string_literal: true

require_relative('../load_paths')
require 'config/default_config'

Aoc.configure do |config|
  config.derp = 'foo'
end
Aoc.logger.info(Aoc.configuration.cache_dir)
Aoc.logger.info(Aoc.derp)
