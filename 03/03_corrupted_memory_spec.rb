require 'rspec'
require_relative '03_corrupted_memory'

describe 'calculate_sum_from_file' do
  it 'calculates the correct sum of enabled multiplications from corrupted_memory_test.txt' do
    test_file_path = '03/corrupted_memory_test.txt'
    expected_sum = 2*4 + 8*5 + 3*3 + 7*7 # The expected sum based on the test input
    expect(calculate_sum_from_file(test_file_path)).to eq(expected_sum)
  end
end 