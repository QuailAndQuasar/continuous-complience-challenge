# Read the locations.txt file and process the data
lines = File.readlines('locations.txt')

# Initialize arrays for the first and second numbers
loc1_arr = []
loc2_arr = []

# Process each line and extract the numbers
lines.each do |line|
  # Split the line and convert to float
  numbers = line.strip.split
  if numbers.length == 2  # Ensure we have exactly two numbers
    loc1_arr << numbers[0].to_f
    loc2_arr << numbers[1].to_f
  end
end

# Sort both arrays from lowest to highest
loc1_arr.sort!
loc2_arr.sort!

# Calculate the absolute differences
distances = []
loc1_arr.each_with_index do |_, i|
  diff = (loc1_arr[i] - loc2_arr[i]).abs
  distances << diff
end

# Calculate and print the sum of all distances
total_distance = distances.sum
puts "The sum of all distances is: #{total_distance.to_i}"

# Calculate similarity array
similarity_arr = []
loc1_arr.each do |value|
  # Count how many times the value appears in loc2_arr
  count = loc2_arr.count(value)
  # Calculate the product and add to similarity array
  similarity_arr << value * count
end

# Calculate and print the sum of similarity array
total_similarity = similarity_arr.sum
puts "The sum of similarity array is: #{total_similarity.to_i}"
