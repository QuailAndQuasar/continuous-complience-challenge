# Read the corrupted memory file
memory = File.read('corrupted_memory.txt')

# Initialize sum of all valid multiplications
total_sum = 0

# Find all valid mul instructions
# Pattern: mul followed by (X,Y) where X and Y are 1-3 digit numbers
memory.scan(/mul\((\d{1,3}),(\d{1,3})\)/) do |x, y|
  # Convert the captured numbers to integers and multiply
  result = x.to_i * y.to_i
  total_sum += result
end

# Print the total sum
puts "Total sum of all valid multiplications: #{total_sum}" 