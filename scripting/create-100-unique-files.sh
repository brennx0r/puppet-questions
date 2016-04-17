#!/bin/sh
# Define first integer to use
i=0

# Build the output files
for i in {0..9}; do
  n=00$i
  # Copy the seed file to new file name
  	cp seed.pp "myfile$n.pp"
  # Replace the integer values in the file for the condition	
  	sed -i "" s/'$n'/$n/g myfile$n.pp
done

for i in {10..99}; do 		
  n=0$i
  # Copy the seed file to new file name
  	cp seed.pp "myfile$n.pp"
  # Replace the integer values in the file for the condition	
  	sed -i "" s/'$n'/$n/g myfile$n.pp
done 

