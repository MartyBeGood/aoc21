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

  describe 'most_common_bit calculations' do
    context 'should not raise' do
      where(:input, :expected) do
        [
          [[[0], [0], [1]], 0],
          [[[0], [1], [1]], 1]
        ]
      end
      with_them do
        it 'should calculate most_common_bit correctly' do
          expect(Day3::Helpers.most_common_bit(input, 0)).to eq(expected)
        end
      end
    end

    it 'should raise if it is tied' do
      expect { Day3::Helpers.most_common_bit([[0], [1]], 0) }.to raise_error(Day3::Helpers::TieError)
    end
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

  it 'should select appropriate lines' do
    expect(Day3::Helpers.select_by_bit(input[0..1], 0, 1)).to eq([[1, 1, 1, 1, 0]])
  end

  it 'should find the oxygen_generator_rating_line' do
    expect(Day3::Helpers.oxygen_generator_rating_line(input)).to eq([1, 0, 1, 1, 1])
  end

  it 'should return the correct oxygen generator rating' do
    expect(Day3::Helpers.oxygen_generator_rating(input)).to eq(23)
  end

  it 'should find the co2 scrubber rating line' do
    expect(Day3::Helpers.co2_scrubber_rating_line(input)).to eq([0, 1, 0, 1, 0])
  end

  it 'should return the correct co2 scrubber rating' do
    expect(Day3::Helpers.co2_scrubber_rating(input)).to eq(10)
  end
end
