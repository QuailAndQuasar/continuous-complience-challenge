def calculate_sum_from_file(file_path)
  contents = File.read(file_path)

  # Initialize a flag to track whether mul instructions are enabled
  enabled = true

  # Initialize a sum to accumulate the results of valid multiplications
  sum = 0

  # Scan the contents for instructions
  contents.scan(/(mul\((\d{1,3}),(\d{1,3})\)|do\(\)|don't\(\))/) do |match|
    instruction = match[0]
    if instruction.include?("do()")
      enabled = true
    elsif instruction.include?("don't()")
      enabled = false
    elsif enabled && instruction.start_with?("mul")
      x, y = match[1..2]
      sum += x.to_i * y.to_i
    end
  end

  sum
end

# Read the contents of the corrupted memory file
file_path = '03/corrupted_memory.txt'

# Output the final sum
puts "The sum of all valid multiplications is: #{calculate_sum_from_file(file_path)}"
