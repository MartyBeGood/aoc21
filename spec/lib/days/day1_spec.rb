# frozen_string_literal: true

require 'days/day_1'

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
    where(:input, :increases) do
      [
        [[1, 2], 1],
        [[1, 2, 3], 2],
        [[2, 1], 0],
        [[2, 2], 0]
      ]
    end

    with_them do
      it "#{params[:input]} should show #{params[:increases]} increases" do
        expect(Day1.count_increases(input)).to eq(increases)
      end
    end
  end

  context 'sliding sum calculation' do
    where(:array, :window, :sums) do
      [
        [[1, 2], 2, [3]],
        [[1, 2, 3], 2, [3, 5]],
        [[1, 2, 5, 3], 3, [8, 10]]
      ]
    end

    with_them do
      it 'should build sliding sums correctly' do
        expect(Day1.sliding_sums(array, window)).to eq(sums)
      end
    end
  end
end
