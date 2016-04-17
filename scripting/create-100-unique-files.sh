#!/bin/sh
# Start at 000 per requirements - this needs rework :(
i=000



# Create the lines for the output file
for i in {0..99}; do
  
  # Copy the seed file to new file name
  	cp seed.pp "myfile$i.pp"

  # Make file replacements for created file
    sed -i 's/$i/"$i"/g' "myfile$i.pp"

done 