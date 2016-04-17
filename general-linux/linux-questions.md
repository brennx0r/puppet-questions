# **General Linux (weight: 25%)**
## **Section 1**
**Your system has two versions of the same executable installed, both have the same filename.  How would you find out where the executable you would run by default is located?**

I would use the whereis command:

`whereis [executable-name]`

In a scenario where two results are given, you can determine which path the OS uses to execute the command using the which command:

`which [executable-name]`

**What metrics are available through top?**

Top is an excellent utility that gives a heads-up-display (HUD) of a number of system statistics, including (but not limited to):

- Running processes and their statuses (running, stuck, sleeping, thread count)
- Load average of the machine
- System memory utilization
- Disk utilization

...as well as a list of running processes with their own metrics (process run time, pid, % CPU use, % memory use, )

**How can you search a linux file system for files named 'blarvitz.c'?**

I would use find:

`find / -type f -name "blarvitz.c"`

Use of "/" means that I want to search the entire system for the file since the question didn't specify any restrictions in this regard.

Use of "-type f" means that I want to constrict the search to specifically searching on files (not directories, symlinks, etc.)

Use of "-name" means that I want to search specifically on the name "blarvitz.c".

**How would you read a log file located in /var/log/messages?**

My approach to reading any log file is going to be different depending on what the circumstances are in wanting to look over the file.  Reasons might include wanting to troubleshoot and resolve an issue, look to see if the log file tracks certain types of information, or just wanting to scan the file out of curiosity. :)

If I am looking for troubleshooting or specific information from the file, and I know what sorts of keywords I want to use in looking over the file, I want to use grep:

`grep "[keyword]" /var/log/messages`

If the issue is currently going on and I want to see instances of the error as it's happening, I want to use tail and grep together:

`tail -f /var/log/messages | grep "[keyword]"`

In the case where I am just curious about what is being logged right now (no keyword to grep against), then I can look at what's being appended to the log file via:

`tail -f /var/log/messages`

Sometimes doing this is a great way to look at how the system is generally behaving and may inform on ideas, tests, etc. you may want to use in the future for the system archetype.

**If I told you to use the command jabberwocky, how can you find its documentation without using Google?**

My instinct would be to use man to get possible manual pages for jabberwocky:

`man jabberwocky`

But, if no information was found, I would also try help and info commands.




## **Section 2**
**How do you redirect stderr and stdout to the same file?**

You can redirect stdout and stderr from a command to the same file via:

```
[command-name] > file-name.txt 2>&1
[command-name] [arguments] > file-name.txt 2>&1
```

**How do you background a long executing process?  How do you bring the process back to the foreground?**

I would use screen.  General tutorial on use of screen is here:  https://www.rackaid.com/blog/linux-screen-tutorial-and-how-to/

Simple explanation on detaching and reattaching can be found here:  http://www.saltycrane.com/blog/2012/10/how-start-long-running-process-screen-and-detach-it/


**Given a log file located at /var/log/mydaemon.log which contains an indefinite number of lines like:**
```
Fri Jun 12 2014 12:00:01.345 user ‘alice’ logged in
Fri Jun 12 2014 14:11:01.112 user ‘bob’ logged in
Sun Jun 14 2014 00:11:01.112 ERROR: disk full
Sun Jun 14 2014 01:05:10.100 ERROR: host is down
Sun Jun 14 2014 08:33:33.333 successful backup
```
**how would you print the twenty most recently logged lines that contain error messages?**

To get the tally of "ERROR" lines in the file:

`grep "ERROR"`

To print the latest 20 lines of a log file, we can give a count using "-n [count]":

`tail -n 20 /var/log/mydaemon.log`

So, to see the last 20 lines which are errors, we'd do the following to bring it all together:

`tail -n 20 /var/log/mydaemon.log | grep "ERROR"`

If "ERROR" is not what is desired, you can parameterize the search term or otherwise modify the grep command to what's desired.



## **Section 3**
**What is the purpose/use of procfs?  Where do you look to find procfs?**

This is a good writeup on procfs:
http://linuxgazette.net/115/nirendra.html

This is a good write-up on the organization of /proc:
https://en.wikipedia.org/wiki/Procfs#Linux

On the job, I interact most with procfs in terms of pid (process id) interaction.  Stuff like finding a process id:

`ps aux | grep [search-term]`

`pidof [args]`

Stopping processes:

`kill [args] [pid]`


**What are the steps for configuring and executing a passwordless login session to a remote linux system?**

You'll want to create and distribute SSH key information in order to accomplish this.

1.  Generate your local system key.  In a terminal, type the following command:

`ssh-keygen`

When prompted for a filename, press the Enter key.  Follow all other instructions before the keygen program exits.  When the program is done with its magic, the following files will have been generated:

```
~/.ssh/id_rsa
~/.ssh/id_rsa.pub
```

The first file is your private key. It only ever needs to exist on your workstation.

The second file is your public key. 

2.  Copy your public key to the remote server.

If you want to install your public key in the authorized_keys file of the remote server

`ssh-copy-id [remote-server]`

You'll be prompted to enter your normal login password on the server and then your public key will be installed. 