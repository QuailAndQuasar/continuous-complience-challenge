require 'rspec'
require_relative '02_report_levels'

describe 'process_reports' do
  it 'calculates the correct number of safe reports from reports_test.txt' do
    test_file_path = '02/reports_test.txt'
    expected_safe_count = 3 # Based on the updated understanding of the sample input
    expect(process_reports(test_file_path)).to eq(expected_safe_count)
  end
end 