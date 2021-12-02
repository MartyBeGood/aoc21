# frozen_string_literal: true

require 'config/aoc'

RSpec.describe Aoc do
  it 'returns an empty config' do
    expect(Aoc.configuration).not_to be_nil
  end
end
