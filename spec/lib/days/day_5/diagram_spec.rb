# frozen_string_literal: true

require 'days/day_5/diagram'

RSpec.describe Day5::Diagram do
  let(:diag) { Day5::Diagram.new(3, 3) }
  it 'should be able to mark a point' do
    diag.mark(Day5::Point.new(2, 2))

    expect(diag.value_at(2, 2)).to be(1)
    expect(diag.value_at(0, 1)).to be(0)
  end

  it 'should be able to draw a line' do
    diag.draw(Day5::Line.new(Day5::Point.new(0, 0), Day5::Point.new(2, 0)))

    (0..2).each do |x|
      expect(diag.value_at(x, 0)).to be(1)
      expect(diag.value_at(x, 1)).to be(0)
      expect(diag.value_at(x, 2)).to be(0)
    end
  end

  it 'should not attempt to draw diagonal lines' do
    diag.draw(Day5::Line.new(Day5::Point.new(0, 0), Day5::Point.new(1, 1)))
    expect(diag.value_at(0, 0)).to be(0)
  end

  it 'should be able to increase values' do
    diag.mark(Day5::Point.new(2, 2))
    diag.mark(Day5::Point.new(2, 2))

    expect(diag.value_at(2, 2)).to be(2)
  end

  it 'should find all overlaps' do
    diag.draw(Day5::Line.new(Day5::Point.new(0, 0), Day5::Point.new(2, 0)))
    diag.draw(Day5::Line.new(Day5::Point.new(2, 0), Day5::Point.new(2, 2)))
    diag.draw(Day5::Line.new(Day5::Point.new(1, 0), Day5::Point.new(1, 2)))

    expect(diag.overlap_count).to be(2)
  end

  context 'acceptance test'

end
