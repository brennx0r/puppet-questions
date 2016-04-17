# **Networking (weight: 15%)**

**What are important differences between TCP and UDP protocols?**

From Wikipedia:

The User Datagram Protocol (UDP) and Transmission Control Protocol (TCP) are the “siblings” of the transport layer in the TCP/IP protocol suite. They perform the same role, providing an interface between applications and the data-moving capabilities of the Internet Protocol (IP), but they do it in very different ways.

A great image representation of the main differences can be found via ![udp vs tcp](https://github.com/brennx0r/puppet-questions/blob/master/networking/tcp-udp.jpg "udp vs tcp")


**What are two TCP/IP name resolution systems?  Please explain how name resolution ordering is configured on a modern Linux system.**

Under Linux you need to use /etc/nsswitch.conf file which is used by system databases and Name Service Switch configuration file

Various functions in the C Library need to be configured to work correctly in the local environment. Tradition ally, this was done by using files (e.g., ‘/etc/passwd’), but other nameservices (like the Network Information Service (NIS) and the Domain Name Service (DNS)) became popular, and were hacked into the C library, usually with a fixed search order.

Step # 1: /etc/nsswitch.conf
Open /etc/nsswitch.conf file using text editor:
# vi /etc/nsswitch.conf

Look for hosts:
hosts: files dns mdns4

Set above order as per your requirement. Close and save the file.

host.conf – resolver configuration file
The file /etc/host.conf contains configuration information specific to the resolver library. It should contain one configuration keyword per line, followed by appropriate configuration information.

Open /etc/host.conf file
# vi /etc/host.conf

Find order line which specifies how host lookups are to be performed. It should be followed by one or more lookup methods, separated by commas. Valid methods are bind (dns server), hosts (/etc/hosts file), and nis (old method).
order hosts,bind

Save and close the file.

 
**Please provide an example of how you would determine if a remote system is ‘listening’ on specific port number?**

You could use telnet:

`telnet [hostname] [port]`

If telnet is not available:

Bash has been able to access TCP and UDP ports for a while. From the man page:

/dev/tcp/host/port
    If host is a valid hostname or Internet address, and port is an integer port number
    or service name, bash attempts to open a TCP connection to the corresponding socket.
/dev/udp/host/port
    If host is a valid hostname or Internet address, and port is an integer port number
    or service name, bash attempts to open a UDP connection to the corresponding socket.
So you could use something like this:

```
cat < /dev/tcp/127.0.0.1/22
SSH-2.0-OpenSSH_6.2p2 Debian-6
(press ^C to escape)
```






Please provide basic troubleshooting steps for isolating connectivity problem between two Linux hosts, using only the shell. 

There's many different layers that you can explore to troubleshoot / resolve, but I'll try to narrow down things to try specifically using the shell as asked.

Can you SSH into either of the hosts?  The below answer assumes that this is possible:

While SSHed into one of the hosts, try the following to gauge connectivity to the second host:

ping [fqdn for second host]
ping [ip of second host]

If you are able to get response with one but not the other, that narrows down the troubleshooting (DNS configuration is likely culprit).

If there's no ping response using either FQDN or IP, you may want to gain local access to the second host and look at the network configuration files like:
 /etc/hosts
The main purpose of this file is to resolve host names that cannot be resolved any other way. It can also be used to resolve host names on small networks with no DNS server. Regardless of the type of network the computer is on, this file should contain a line specifying the IP address of the loopback device (127.0.0.1) as localhost.localdomain. For more information, see the hosts(5) manual page.
 /etc/resolv.conf
This file specifies the IP addresses of DNS servers and the search domain. Unless configured to do otherwise, the network initialization scripts populate this file. For more information about this file, see the resolv.conf(5) manual page.
 /etc/sysconfig/network
This file specifies routing and host information for all network interfaces. It is used to contain directives which are to have global effect and not to be interface specific. For more information about this file and the directives it accepts, see Section D.1.13, “/etc/sysconfig/network”.
 /etc/sysconfig/network-scripts/ifcfg-interface-name
For each network interface, there is a corresponding interface configuration script. Each of these files provide information specific to a particular network interface. See Section 10.2, “Interface Configuration Files” for more information on this type of file and the directives it accepts.




How do you list a system’s currently open ports and/or active connections?

netstat command, which prints network connections, routing tables, interface statistics, masquerade connections, and multicast memberships, etc. 

To find open ports:

netstat -l

To find open ports and active connections:

netstat -vatn


Another (and suggested) option is to use the lsof command, which lists open files, and ports on Linux, FreeBSD, Solaris and other Unixish systems.

To display the list of open ports:

lsof -i

To display all open files:

lsof

