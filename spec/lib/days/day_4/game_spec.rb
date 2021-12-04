# frozen_string_literal: true

require 'days/day_4/game'

RSpec.describe Day4::Game do
  let(:game) do
    Day4::Game.new(
      [
        Day4::Board.new([
                          [1, 2],
                          [3, 4]
                        ]),
        Day4::Board.new([
                          [5, 2],
                          [4, 9]
                        ])
      ],
      [1, 4, 5, 3]
    )
  end

  it 'should do a step successfully' do
    game.step
    expect(game.boards[0].markings).to eq([
                                            [true, false],
                                            [false, false]
                                          ])
    expect(game.boards[1].markings).to eq([
                                            [false, false],
                                            [false, false]
                                          ])
  end

  it 'should find the first winner' do
    3.times { game.step }
    expect(game.find_winners).to eq([1])
  end

  it 'should find all winners' do
    4.times { game.step }
    expect(game.find_winners).to eq([0, 1])
  end
end
