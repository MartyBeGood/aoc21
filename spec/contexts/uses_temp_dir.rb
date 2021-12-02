# frozen_string_literal: true

require 'tmpdir'
RSpec.shared_context :uses_temp_dir do
  around do |testcase|
    Dir.mktmpdir('rspec-') do |tempdir|
      @temp_dir = tempdir
      testcase.run
    end
  end
  attr_reader :temp_dir
end
