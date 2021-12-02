# frozen_string_literal: true

require 'day_1'

describe Day1 do
  context 'input parsing' do
    it 'should parse well-formed input correctly' do
      input = <<~ENDOFINPUT
        1
        2
        3
      ENDOFINPUT
      expect(Day1.parse_input(input)).to eq([1, 2, 3])
    end

    it 'should fail on bad input' do
      input = <<~END_OF_INPUT
        1
        foo
        3
      END_OF_INPUT
      expect { Day1.parse_input(input) }.to raise_error(ArgumentError)
    end
  end
  context 'increment counting' do
    it 'should report increase for increasing numbers' do
      expect(Day1.count_increases([1, 2])).to eq(1)
    end

    it 'should report multiple increases for increasing numbers' do
      expect(Day1.count_increases([1, 2, 3])).to eq(2)
    end

    it 'should not report increase for decreasing numbers' do
      expect(Day1.count_increases([2, 1])).to eq(0)
    end

    it 'should not report increase for same numbers' do
      expect(Day1.count_increases([2, 2])).to eq(0)
    end
  end
end
