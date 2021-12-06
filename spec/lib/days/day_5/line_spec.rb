# frozen_string_literal: true

require 'days/day_5/line'

RSpec.describe Day5::Line do
  context 'general line' do
    let(:general) { Day5::Line.new(Day5::Point.new(0, 0), Day5::Point.new(2, 5)) }

    it 'should not be horizontal' do
      expect(general.horizontal?).to be(false)
    end

    it 'should not be vertical' do
      expect(general.vertical?).to be(false)
    end

    it 'should not be drawable?' do
      expect(general.drawable?).to be(false)
    end

    it 'should stringify correctly' do
      expect(general.to_s).to eq('(0, 0) -> (2, 5)')
    end

    it 'should raise an error when trying to get all points' do
      expect { general.all_points }.to raise_error(Day5::NotDrawableError)
    end
  end

  context 'horizontal line' do
    let(:horizontal) { Day5::Line.new(Day5::Point.new(3, 3), Day5::Point.new(3, 6)) }

    it 'should be horizontal' do
      expect(horizontal.horizontal?).to be(true)
    end

    it 'should not be vertical' do
      expect(horizontal.vertical?).to be(false)
    end

    it 'should be drawable?' do
      expect(horizontal.drawable?).to be(true)
    end

    it 'should give all points' do
      expect(horizontal.all_points).to eq([
                                            Day5::Point.new(3, 3),
                                            Day5::Point.new(3, 4),
                                            Day5::Point.new(3, 5),
                                            Day5::Point.new(3, 6)
                                          ])
    end
  end

  context 'vertical line' do
    let(:vertical) { Day5::Line.new(Day5::Point.new(2, 0), Day5::Point.new(6, 0)) }

    it 'should not be horizontal' do
      expect(vertical.horizontal?).to be(false)
    end

    it 'should be vertical' do
      expect(vertical.vertical?).to be(true)
    end

    it 'should be drawable?' do
      expect(vertical.drawable?).to be(true)
    end

    it 'should give all points' do
      expect(vertical.all_points).to eq([
                                          Day5::Point.new(2, 0),
                                          Day5::Point.new(3, 0),
                                          Day5::Point.new(4, 0),
                                          Day5::Point.new(5, 0),
                                          Day5::Point.new(6, 0)
                                        ])
    end
  end
end
