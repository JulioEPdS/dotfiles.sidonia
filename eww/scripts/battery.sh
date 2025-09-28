#!/bin/bash

# Run upower --dump and store the output in a variable
upower_output=$(upower --dump)
#
# # Define a list of "Device: " descriptors to check for
devices=("gaming_input_dev_F4_6A_D7_78_01_B8" ) # Add more descriptors as needed
#
output=""
#
# # Loop through each descriptor
for device in "${devices[@]}"; do
# # Check if the device descriptor exists in the upower output
    if grep -q "Device: /org/freedesktop/UPower/devices/$device" <<< "$upower_output"; then
# # Extract battery percentage for the device using awk
        percentage=$(awk -v dev="/org/freedesktop/UPower/devices/$device" '$0 ~ dev {while(getline) {if ($1 == "percentage:") {print $2; exit}}} ' <<< "$upower_output")
# # Append the battery percentage with the 🎮 icon to the output string
        output="$output🎮 $percentage"
# # Separate each device's percentage with "|"
        output="$output | "
    fi
done
#
# # Remove the trailing " | " from the output string
output="${output% | }"
#
# # Check if the output string is empty
if [ -z "$output" ]; then
# # If output is empty, set it to a singular space character
    output=" "
fi
#
# # Print the formatted output
echo "$output"
