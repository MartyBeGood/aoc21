# frozen_string_literal: true

require 'days/day_4/input_parser'

RSpec.describe Day4::Input do
  it 'should split a sequence line correctly' do
    expect(Day4::Input.sequence_line_to_int_array("1,2,11,42,19\n")).to eq([1, 2, 11, 42, 19])
  end

  it 'should split a board line correctly' do
    expect(Day4::Input.board_line_to_int_array(' 8  2 23  4 24')).to eq([8, 2, 23, 4, 24])
  end

  it 'should split a multiline input into blocks, separated by empty lines' do
    input = <<~THEFILE
      7,4,9,5,11,17,23,2

      22 13
       8  2

      21  9
       6 10
    THEFILE

    expect(Day4::Input.split_into_blocks(input)).to eq([
                                                         '7,4,9,5,11,17,23,2',
                                                         "22 13\n 8  2",
                                                         "21  9\n 6 10"
                                                       ])
  end

  it 'should split a block to a 2-dimensional int array' do
    input = <<~THEBLOCK
      21  9
       6 10
    THEBLOCK

    expect(Day4::Input.block_to_board_array(input)).to eq([
                                                            [21, 9],
                                                            [6, 10]
                                                          ])
  end

  it 'should keep everything available in an Input::Parser' do
    input = <<~THEFILE
      7,4,9,5,11,17,23,2

      22 13
       8  2

      21  9
       6 10
    THEFILE
    parser = Day4::Input::Parser.new(input)
    expect(parser.sequence).to eq([7, 4, 9, 5, 11, 17, 23, 2])
    expect(parser.boards).to eq([
                                  [
                                    [22, 13],
                                    [8, 2]
                                  ],
                                  [
                                    [21, 9],
                                    [6, 10]
                                  ]
                                ])
  end
end
