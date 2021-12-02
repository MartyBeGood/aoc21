# frozen_string_literal: true

def cleanup_load_path
  # Expand each path.
  $LOAD_PATH.each_with_index do |path, index|
    $LOAD_PATH[index] = File.expand_path(path)
  end

  # Remove duplicates.
  $LOAD_PATH.uniq!
end

def prepend_to_load_path(dir)
  raise "Cannot add nonexistent #{dir} to $LOAD_PATH" unless Dir.exist? dir

  # Prepend dir to LOAD_PATH.
  $LOAD_PATH.unshift dir

  cleanup_load_path
end

# foobar.gemspec
prepend_to_load_path(File.join(__dir__, 'lib'))

# bin/foobar
# prepend_to_load_path File.join 'lib', File.dirname(__dir__)
