# frozen_string_literal: true

require('config/aoc')

Aoc.configure do |config|
  config.cache_dir_path = Pathname.new(Dir.pwd).join('cache')
end
