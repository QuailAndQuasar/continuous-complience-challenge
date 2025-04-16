def process_reports(file_path)
  lines = File.readlines(file_path)

  # Initialize array for safe levels
  safe_levels_arr = []

  # Process each line (report)
  lines.each_with_index do |line, line_index|
    # Convert the line to an array of integers
    levels = line.strip.split.map(&:to_i)
    
    # Check if the levels are either all strictly increasing or all strictly decreasing
    is_increasing = true
    is_decreasing = true
    bad_levels_count = 0
    bad_level_index = nil
    
    # First pass: check for bad levels and count them
    (0...levels.length - 1).each do |i|
      diff = (levels[i + 1] - levels[i]).abs
      
      if diff < 1 || diff > 3
        bad_levels_count += 1
        bad_level_index = i
      end
      
      # Update monotonicity flags - do not allow equal values
      if levels[i + 1] < levels[i]
        is_increasing = false
      elsif levels[i + 1] > levels[i]
        is_decreasing = false
      else
        is_increasing = false
        is_decreasing = false
      end
    end
    
    puts "Processing report: #{levels.join(' ')}"
    puts "Initial state - Increasing: #{is_increasing}, Decreasing: #{is_decreasing}, Bad Levels: #{bad_levels_count}"

    # If there's exactly one bad level
    if bad_levels_count == 1
      puts "One bad level found at index #{bad_level_index}, attempting to remove it."
      # Create a new array without the bad level
      new_levels = levels.dup
      new_levels.delete_at(bad_level_index)
      
      # Check if the new array is safe
      new_is_increasing = true
      new_is_decreasing = true
      new_bad_levels = 0
      
      # Check continuity between elements before and after the removed bad level
      if bad_level_index > 0 && bad_level_index < new_levels.length
        diff = (new_levels[bad_level_index] - new_levels[bad_level_index - 1]).abs
        if diff < 1 || diff > 3
          new_bad_levels += 1
        end
      end
      
      (0...new_levels.length - 1).each do |i|
        diff = (new_levels[i + 1] - new_levels[i]).abs
        
        if diff < 1 || diff > 3
          new_bad_levels += 1
          break
        end
        
        if new_levels[i + 1] < new_levels[i]
          new_is_increasing = false
        elsif new_levels[i + 1] > new_levels[i]
          new_is_decreasing = false
        end
      end
      
      # If the new array is safe, consider the original report safe
      if (new_is_increasing || new_is_decreasing) && new_bad_levels == 0
        puts "Report is safe after removing bad level: #{new_levels.join(' ')}"
        safe_levels_arr << levels
        next
      else
        puts "UNSAFE (after removing bad level): #{levels.join(' ')}"
      end
    elsif bad_levels_count > 1
      puts "UNSAFE (multiple bad levels): #{levels.join(' ')}"
    elsif !is_increasing && !is_decreasing
      puts "UNSAFE (not monotonic): #{levels.join(' ')}"
    end
    
    # If the report is not already safe, apply the Problem Dampener
    if !(is_increasing || is_decreasing) && bad_levels_count == 0
      (0...levels.length).each do |remove_index|
        new_levels = levels.dup
        new_levels.delete_at(remove_index)

        new_is_increasing = true
        new_is_decreasing = true

        (0...new_levels.length - 1).each do |i|
          if new_levels[i + 1] < new_levels[i]
            new_is_increasing = false
          elsif new_levels[i + 1] > new_levels[i]
            new_is_decreasing = false
          else
            new_is_increasing = false
            new_is_decreasing = false
            break
          end
        end

        if new_is_increasing || new_is_decreasing
          puts "Report is safe with Problem Dampener by removing level at index #{remove_index}: #{new_levels.join(' ')}"
          safe_levels_arr << levels
          break
        end
      end
    end
    
    # If the report is either increasing or decreasing and all differences are valid
    if (is_increasing || is_decreasing) && bad_levels_count == 0
      puts "Report is safe: #{levels.join(' ')}"
      safe_levels_arr << levels
    end
    puts "Final state - Safe Levels Count: #{safe_levels_arr.length}"
    puts "----------------------------------------"
  end

  # Return the number of safe levels found
  safe_levels_arr.length
end

if __FILE__ == $0
  # Read the reports.txt file and process the data
  file_path = 'reports.txt'

  # Print the number of safe levels found
  puts "Number of SAFE levels found: #{process_reports(file_path)}"
end
