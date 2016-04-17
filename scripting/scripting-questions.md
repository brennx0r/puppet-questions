Scripting (weight: 30%)

What version control systems have you used?  Why use version control?

I have used CVS back in the day,and currently use both SVN and Git in my current job.  We use version control so that we can conduct many different types and levels of devleopment activities, including:

- Tracking file state over time 
- Tracking down when new feature sets were added
- Tracking when bug fixes were introduced
- Providing tags that we want to use for deployment to systems
- Providing branches that one or more team members can use to isolate or implement new code





For a directory containing multiple files, implement a way to scan each file for the string "foobar" and replace it with "fubar"

There's a numerous different utilities which will allow you to do this, including sed, awk, etc.

But, the performance of each is going to be vastly different.  There's many articles on the Internet that go through benchmarking of the speed of sed vs. awk vs. other programming languages used for search/replace scripts.

Here's an example result from one of the benchmarks:


Utility Operation type  Execution time (10 iterations)  Characters processed per second
grep  search only 41 seconds  489.3 million
sed search & replace  4 minutes 4 seconds 82.1 million
awk search & replace  4 minutes 46 seconds  69.8 million
Python script search & replace  4 minutes 50 seconds  69.0 million
PHP script  search & replace  15 minutes 44 seconds 21.2 million


So, let's provide a solution for this using sed:

sed -i 's/foobar/fubar/g' /path/to/dir/*


For this exercise, create a file containing 100 unique users. All fields must be unique. The data should be formatted in CSV format in this manner:  id,name,email

There are a couple different elements that we want to focus on in the creation of this script:

1. id - I assume here that the id will start at 1, and for each line created in the file, we will iterate the id by 1.  Just in case my assumption is incorrect, in the script I will provide a way to declare what number you want to use as your "start" id value.


2.  name - Because there was no informational constraints given on the name, I will use the convention:

AwesomeUnicornGlitter[id]

3.  email - Even though there were no contraints on this field (other than it must be unique), we will follow loosely follow RFC convention on the email (though this might be controversial - http://girders.org/blog/2013/01/31/dont-rfc-validate-email-addresses/ discusses why you might not want to do this.)
To be simple, let's go with [name]@puppet.com .

4.  The file name - Since a desired name was not included in the question, we will use awesome-new-users.txt

The creation of the script is detailed over in Github via https://github.com/brennx0r/puppet-questions/blob/master/scripting/create-100-unique-users.sh


How can you create 100 files named 000.pp ... 099.pp whose contents are:

class myfile000 {
    if $kernel == "Linux" {
      file { '/tmp/myfile000':
        ensure  => file,
        backup  => false,
        content => "Hello myfile000",
      }
    }
 }
...
class myfile099 {
    if $kernel == "Linux" {
      file { '/tmp/myfile099':
        ensure  => file,
        backup  => false,
        content => "Hello myfile099",
      }
    }
 }



First thing I would want to do is create a "baseline" seed file that is parameterized on the integer identities to use for creation of the files need myfile000.pp - myfile099.pp)

Next, I create the script that will use for each in i == 000 through i == 099:

1. Copies the seed file to a new file using syntax myfile$1.pp
2. Scans the created file and replaces $i with the perameter value for all relevant instances of $1 in the file




