# frozen_string_literal: true

require 'days/day_2/submarine'
require 'days/day_2/move_command'

describe Day2::Submarine do
  let(:sub) { Day2::Submarine.new }
  it 'should initialize' do
    expect(sub).to_not be_nil
    expect(sub.depth).to be(0)
    expect(sub.distance).to be(0)
  end

  it 'should sink' do
    sub.move(Day2::MoveCommand.new(:down, 2))
    expect(sub.depth).to be(2)
  end

  it 'should propel' do
    sub.move(Day2::MoveCommand.new(:forward, 2))
    expect(sub.distance).to be(2)
  end

  describe 'rising' do
    it 'should sink, then rise a bit' do
      sub.move(Day2::MoveCommand.new(:down, 2))
      sub.move(Day2::MoveCommand.new(:up, 1))
      expect(sub.depth).to be(1)
    end

    it 'should sink, then rise completely' do
      sub.move(Day2::MoveCommand.new(:down, 2))
      sub.move(Day2::MoveCommand.new(:up, 2))
      expect(sub.depth).to be(0)
    end

    it 'should not fly' do
      sub.move(Day2::MoveCommand.new(:down, 2))
      sub.move(Day2::MoveCommand.new(:up, 3))
      expect(sub.depth).to be(0)
    end
  end

  describe 'multiple commands' do
    it 'should follow multiple commands' do
      sub.move(
        Day2::MoveCommand.new(:down, 2),
        Day2::MoveCommand.new(:forward, 2)
      )
      expect(sub.depth).to be(2)
      expect(sub.distance).to be(2)
    end
  end
end
