require 'rspec'
require_relative '01_locations'

RSpec.describe 'process_locations' do
  let(:file_path) { 'locations_test.txt' }
  let(:expected_result) { { total_distance: 1, total_similarity: 42 } }

  it 'processes the locations and returns correct total distance and similarity' do
    result = process_locations(file_path)
    expect(result[:total_distance].to_i).to eq(expected_result[:total_distance])
    expect(result[:total_similarity].to_i).to eq(expected_result[:total_similarity])
  end
end 