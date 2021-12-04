# frozen_string_literal: true

require 'days/day_4/board'

RSpec.describe Day4::Board do
  let(:board) do
    Day4::Board.new([
                      [1, 2],
                      [3, 4]
                    ])
  end

  context 'initalization' do
    it 'should have numbers' do
      expect(board.numbers).to eq([[1, 2], [3, 4]])
    end

    it 'should have empty markings' do
      expect(board.markings).to eq([[false, false], [false, false]])
    end

    it 'should have a score' do
      expect(board.score).to eq(10)
    end

    it 'should not have won' do
      expect(board.won?).to eq(false)
    end
  end

  context 'marking numbers' do
    it 'should mark a called number' do
      board.call(4)
      expect(board.markings).to eq([
                                     [false, false],
                                     [false, true]
                                   ])
    end

    it 'should mark several called numbers' do
      board.call(1)
      board.call(4)
      expect(board.markings).to eq([
                                     [true, false],
                                     [false, true]
                                   ])
    end

    it 'should not factor marked numbers into the score' do
      board.call(3)
      expect(board.score).to be(7)
    end
  end

  context 'full row' do
    before(:each) do
      board.call(3)
      board.call(4)
    end

    it 'should report a full row' do
      expect(board.full_row?).to be(true)
    end

    it 'should report to have won' do
      expect(board.won?).to be(true)
    end
  end

  context 'full column' do
    before(:each) do
      board.call(2)
      board.call(4)
    end

    it 'should report a full column' do
      expect(board.full_column?).to be(true)
    end

    it 'should report to have won' do
      expect(board.won?).to be(true)
    end
  end
end
