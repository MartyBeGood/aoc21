# frozen_string_literal: true

require 'days/day_6'

RSpec.describe Day6::School do
  it 'should do the example' do
    school = Day6::School.new([3, 4, 3, 1, 2])
    80.times { school.tick }
    expect(school.num_fish).to eq(5934)
  end
end
