# frozen_string_literal: true

require 'input/input_provider'
require 'uses_temp_dir'

describe InputProvider do
  it 'raises exception when config can not be found' do
    expect { InputProvider.get_input_for_day(1) }.to raise_error(InputProvider::InputNotFound)
  end

end
context 'Local Cache' do
  it 'returns local input if available' do
    Aoc.configure do |config|

    end

  end
end
