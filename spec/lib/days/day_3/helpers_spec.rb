# frozen_string_literal: true

require 'days/day_3/helpers'

RSpec.describe Day3::Helpers do
  let(:input) do
    [
      [0, 0, 1, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 1, 1, 0],
      [1, 0, 1, 1, 1],
      [1, 0, 1, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 1, 1, 1],
      [1, 1, 1, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 1, 0, 1, 0]
    ]
  end

  it 'should return an array containing all most common bits' do
    expect(Day3::Helpers.most_common_bits(input)).to eq([1, 0, 1, 1, 0])
  end

  it 'should return an array containing all least common bits' do
    expect(Day3::Helpers.least_common_bits(input)).to eq([0, 1, 0, 0, 1])
  end

  it 'should calculate the gamma rate correctly' do
    expect(Day3::Helpers.gamma_rate(input)).to eq(22)
  end

  it 'should calculate the epsilon rate correctly' do
    expect(Day3::Helpers.epsilon_rate(input)).to eq(9)
  end

  it 'should build a binary string correctly' do
    expect(Day3::Helpers.binary_string(input[0])).to eq('00100')
  end

  it 'should convert a line to a number correctly' do
    expect(Day3::Helpers.bits_to_number(input[0])).to eq(4)
  end
end
