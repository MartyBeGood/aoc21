# frozen_string_literal: true

require 'days/day_3/report_parser'

RSpec.describe Day3::ReportParser do
  context 'Length verification' do
    it 'should raise on non-equal line lengths' do
      expect { Day3::ReportParser.verify_same_lengths('1', '22') }.to raise_error(ArgumentError)
    end

    it 'should not raise on equal line lengths' do
      expect { Day3::ReportParser.verify_same_lengths('22', 'aa') }.to_not raise_error(ArgumentError)
    end
  end

  context 'binary verification' do
    context 'failure cases' do
      where(:input) do
        ['2', 'a', '-']
      end

      with_them do
        it 'should raise' do
          expect { Day3::ReportParser.verify_binary_strings(input) }.to raise_error(ArgumentError)
        end
      end
    end

    it 'should verify binary ints successfully' do
      expect { Day3::ReportParser.verify_binary_strings('101', '110') }.to_not raise_error
    end
  end

  context 'String to int' do
    it 'should transform strings of digits into arrays of single-digit ints' do
      expect(Day3::ReportParser.break_into_int_arrays('101', '01')).to eq([[1, 0, 1], [0, 1]])
    end
  end
end
