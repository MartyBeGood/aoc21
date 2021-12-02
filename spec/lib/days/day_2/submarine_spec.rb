# frozen_string_literal: true

require 'days/day_2/submarine'
require 'days/day_2/move_command'

RSpec.context Day2::Submarine do
  let(:sub) { Day2::Submarine.new }
  it 'should initialize' do
    expect(sub).to_not be_nil
    expect(sub.depth).to be(0)
    expect(sub.distance).to be(0)
    expect(sub.aim).to be(0)
  end

  it 'should aim down' do
    sub.move(Day2::MoveCommand.new(:down, 2))
    expect(sub.aim).to be(2)
  end

  it 'should aim up' do
    sub.move(Day2::MoveCommand.new(:up, 2))
    expect(sub.aim).to be(-2)
  end
  describe 'actual moving' do
    it 'move while aiming down' do
      sub.move(
        Day2::MoveCommand.new(:down, 2),
        Day2::MoveCommand.new(:forward, 2)
      )
      expect(sub.distance).to be(2)
      expect(sub.depth).to be(4)
      expect(sub.aim).to be(2)
    end

    it 'move while aiming up' do
      sub.move(
        Day2::MoveCommand.new(:down, 2),
        Day2::MoveCommand.new(:forward, 2),
        Day2::MoveCommand.new(:up, 3),
        Day2::MoveCommand.new(:forward, 2)
      )
      expect(sub.distance).to be(4)
      expect(sub.depth).to be(2)
      expect(sub.aim).to be(-1)
    end

    it 'should not fly' do
      sub.move(
        Day2::MoveCommand.new(:down, 2), # a 2
        Day2::MoveCommand.new(:forward, 2), # > 2, v 4
        Day2::MoveCommand.new(:up, 5), # a -3
        Day2::MoveCommand.new(:forward, 2) # > 4, v -2
      )
      expect(sub.distance).to be(4)
      expect(sub.depth).to be(0)
      expect(sub.aim).to be(-3)
    end
  end
end
