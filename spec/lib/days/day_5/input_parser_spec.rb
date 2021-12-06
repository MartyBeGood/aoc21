# frozen_string_literal: true

require 'days/day_5/input_parser'

RSpec.describe Day5::Input::Parser do
  it 'should split lines into coordinate pairs' do
    expect(Day5::Input.line_to_coordinate_pair('0,9 -> 5,9')).to eq([[0, 9], [5, 9]])
  end

  context 'acceptance test' do
    let(:parser) do
      Day5::Input::Parser.new(<<~ENDOFINPUT
        0,9 -> 5,9
        8,0 -> 0,8
        9,4 -> 3,4
        2,2 -> 2,1
        7,0 -> 7,4
        6,4 -> 2,0
        0,9 -> 2,9
        3,4 -> 1,11
        0,0 -> 8,8
        5,5 -> 8,2
      ENDOFINPUT
                             )
    end
    it 'should have the correct size' do
      expect(parser.coordinate_pairs.length).to be(10)
    end

    it 'should have correct maxima' do
      expect(parser.max_x).to be(9)
      expect(parser.max_y).to be(11)
    end
  end
end
