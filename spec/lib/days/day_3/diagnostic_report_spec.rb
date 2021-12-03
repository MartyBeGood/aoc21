# frozen_string_literal: true

require 'days/day_3/diagnostic_report'

RSpec.describe Day3::DiagnosticReport do
  let(:report) { Day3::DiagnosticReport.new([[0, 0, 1], [0, 1, 1], [1, 1, 1]]) }
  describe 'should initialize' do
    it 'should contain the lines' do
      expect(report.lines).to eq([[0, 0, 1], [0, 1, 1], [1, 1, 1]])
    end

    it 'should say it has 3 columns' do
      expect(report.num_columns).to eq(3)
    end

    it 'should sum up columns correctly' do
      expect(report.column_sums).to eq([1, 2, 3])
    end
  end

  describe 'bit calculations' do
    it 'should provide the most common bits correctly' do
      expect(report.most_common_bits).to eq([0, 1, 1])
    end

    it 'should provide the least common bits correctly' do
      expect(report.least_common_bits).to eq([1, 0, 0])
    end
  end

  describe 'rate calculations' do
    it 'should calculate the gamma rate correctly' do
      expect(report.gamma_rate).to eq(3)
    end

    it 'should calculate the epsilon rate correctly' do
      expect(report.epsilon_rate).to eq(4)
    end
  end
end
