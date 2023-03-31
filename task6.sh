#!/bin/bash

input_file="bash_scripting_q6.csv"

output_file="formatted.csv"
warning_file="warnings.log"

# Check if input file exists and is readable
if [[ ! -r "$input_file" ]]; then
  echo "Error: Input file not found or not readable"
  exit 1
fi

touch "$output_file"


echo "First Name,Last Name,full name,Email,Phone Number,Email Domain"  >> "$output_file"
while IFS=',' read -r fname lname email phone; do
	
  # Check if the phone number is in the correct format
  	numeric_phone_number=$(echo "$phone" | tr -cd '[:digit:]')
    # Check if the resulting string has a length of 10
	if [ ${#numeric_phone_number} -ne 10 ]; then
	# Log warning to warnings.log file
    echo "Warning: invalid phone number in row: $fname $lname $email $phone" >> warnings.log     
    continue
  	else
   #formatting ph number
    formatted_phone_number=$(echo "$numeric_phone_number" | sed -E 's/^([0-9]{3})([0-9]{3})([0-9]{4})$/(\1) \2-\3/')

  	
  	echo $fname,$lname,$fname" "$lname,$email,$formatted_phone_number,$email_domain >> formatted.csv
  	fullname="$fname $lname"
  
  	
    
  
  	sort -t',' -k3 "$output_file" -o "$output_file"
   
    
  fi

done < "$input_file"
#summary report
total_rows=$(wc -l < "$output_file")
formatted_rows=$(wc -l < formatted.csv)

skipped_rows=$(wc -l < "warnings.log")
echo "Total rows in input file: $total_rows"
echo "Rows successfully formatted and written to output file: $formatted_rows"
echo "Rows skipped due to invalid phone numbers: $skipped_rows"
echo "Top 10 most common email domains:"
awk -F "@" '{print $NF}' "$output_file" | sort | uniq -c | sort -rn | head -10 | awk '{print $2" "$1}'
rm "formatted.csv"
rm "warnings.log"
