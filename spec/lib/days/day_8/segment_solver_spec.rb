# frozen_string_literal: true

require 'days/day_8/segment_solver'

RSpec.describe Day8::SegmentSolver do
  let(:solver) do
    Day8::SegmentSolver.new(%w[fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega]).solve
  end

  it 'should solve' do
    expect(solver.signal_for).to eq({
                                      0 => Set['c', 'd', 'b', 'g', 'e', 'f'],
                                      1 => Set['b', 'e'],
                                      2 => Set['a', 'b', 'c', 'd', 'f'],
                                      3 => Set['f', 'e', 'c', 'd', 'b'],
                                      4 => Set['c', 'g', 'e', 'b'],
                                      5 => Set['f', 'g', 'e', 'c', 'd'],
                                      6 => Set['f', 'g', 'e', 'c', 'd', 'a'],
                                      7 => Set['e', 'd', 'b'],
                                      8 => Set['a', 'b', 'c', 'd', 'e', 'f', 'g'],
                                      9 => Set['c', 'd', 'b', 'g', 'e', 'f']
                                    })
  end

  it 'should translate' do
    solver.solve
    expect(solver.translate(%w[fdgacbe cefdb cefbgd gcbe])).to eq(
      [9,3,6,1]
    )
  end
end
