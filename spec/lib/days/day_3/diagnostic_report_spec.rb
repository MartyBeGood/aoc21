# frozen_string_literal: true

require 'days/day_3/diagnostic_report'

RSpec.describe Day3::DiagnosticReport do
  let(:report) { Day3::DiagnosticReport.new([[0, 0, 1], [0, 1, 1], [1, 1, 1]]) }
  describe 'should initialize' do
    it 'should contain the lines' do
      expect(report.lines).to eq([[0, 0, 1], [0, 1, 1], [1, 1, 1]])
    end
  end
end
