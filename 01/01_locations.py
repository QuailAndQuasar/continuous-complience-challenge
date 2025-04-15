# Read the locations.txt file and process the data
with open('locations.txt', 'r') as file:
    lines = file.readlines()

# Initialize arrays for the first and second numbers
loc1_arr = []
loc2_arr = []

# Process each line and extract the numbers
for line in lines:
    # Split the line and convert to float
    numbers = line.strip().split()
    if len(numbers) == 2:  # Ensure we have exactly two numbers
        loc1_arr.append(float(numbers[0]))
        loc2_arr.append(float(numbers[1]))

# Sort both arrays from lowest to highest
loc1_arr.sort()
loc2_arr.sort()

# Calculate the absolute differences
distances = []
for i in range(len(loc1_arr)):
    diff = abs(loc1_arr[i] - loc2_arr[i])
    distances.append(diff)

# Calculate and print the sum of all distances
total_distance = sum(distances)
print(f"The sum of all distances is: {int(total_distance)}")

