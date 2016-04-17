Scripting (weight: 30%)

What version control systems have you used?  Why use version control?

For a directory containing multiple files, implement a way to scan each file for the string "foobar" and replace it with "fubar"

For this exercise, create a file containing 100 unique users. All fields must be unique. The data should be formatted in CSV format in this manner:  id,name,email

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
