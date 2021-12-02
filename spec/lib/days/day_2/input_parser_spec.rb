# frozen_string_literal: true

require 'days/day_2/input_parser'

RSpec.describe Day2 do
  context 'input parsing' do
    context 'well-formed lines' do
      where(:input, :direction, :distance) do
        [
          ['forward 5', :forward, 5],
          ['down 5', :down, 5],
          ['up 3', :up, 3]
        ]
      end

      with_them do
        it 'should parse line correctly' do
          expect(Day2.parse_input(input)).to eq([Day2::MoveCommand.new(direction, distance)])
        end
      end
    end

    context 'multiple well-formed lines' do
      it 'should parse multiple lines correctly' do
        input = <<~INPUT
          forward 5
          down 5
          forward 8
          up 3
          down 8
          forward 2
        INPUT

        expected = [
          Day2::MoveCommand.new(:forward, 5),
          Day2::MoveCommand.new(:down, 5),
          Day2::MoveCommand.new(:forward, 8),
          Day2::MoveCommand.new(:up, 3),
          Day2::MoveCommand.new(:down, 8),
          Day2::MoveCommand.new(:forward, 2)
        ]

        expect(Day2.parse_input(input)).to eq(expected)
      end
    end

    # TODO: Check for malformed input
  end
end
