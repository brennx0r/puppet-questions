#!/bin/sh
# Let i have input from use
i=$1
FILENAME=$2

#Handle condition where there's no or 'incorrect' input from the user

		# Condition where no input from user

		# Condition where integer value is not a positive integer value


#Handle condition where there's no input on the filename or filename is not valid

		# Condition where no input from user

		# Condition where no input from user



# Create the lines for the output file
for i in {1..100}; do
  echo "class myfile$i {"+\n+"if $kernel == \"Linux\" {"+\n+"file { '/tmp/myfile"+$1+"':"+\n+"ensure  => file,"+\n+"backup  => false,"+\n+"content => \"Hello myfile$1\","+\n+"}"+\n+"}"+\n"}" >> $2
done 