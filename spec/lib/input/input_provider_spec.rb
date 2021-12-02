# frozen_string_literal: true

require 'input/input_provider'
require 'uses_temp_dir'

RSpec.describe InputProvider do
  include_context :uses_temp_dir
  before(:each) do
    Aoc.configure do |config|
      config.cache_dir = temp_dir
    end
  end
  it 'raises exception when config can not be found' do
    expect do
      InputProvider.get_input_for_day(1)
    end.to raise_error(InputProvider::InputNotFound)
  end

  context 'Local Cache' do
    it 'returns local input if available' do
      Aoc.configure do |config|
        config.cache_dir = File.join(Dir.pwd, 'spec', 'test_data')
      end
      expected_content = "1\n2\n3\n"
      expect(InputProvider.get_input_for_day(1)).to eq(expected_content)
    end
  end
end
