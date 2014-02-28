pktgen
======

Kernel module for packet generator and packet receiver with statistics. Source based from Linux Kernel pktgen 3.11.0

To compile the headers of the running kernel are required.

> sudo apt-get install linux-headers-$(uname -r)

Current version for kernel 3.11.0. It uses netfilter hooks to process incomming packets.

To compile and load the module:

> make

> insmod ./pktgen.ko

it is necessary to map each interrupt with a different core. You can use  [eth-affinity] (https://github.com/jelaas/eth-affinity) to set up
automaticaly.

> eth-affinity

to start the receiver, you need to be root

> sudo su

> echo rx eth1 > /proc/net/pktgen/pgrx

Some options for the receiver:

* rx [device] to enable the receiver part for a specific device. If it is wrong, all the devices are used. (all versions)
* rx_reset: to reset the counters
* rx_disable: to disable the receiver
* display [human or script]
* statistics [counter, basic, or time] 


to read the results

> cat /proc/net/pktgen/pgrx

and change output format:

> echo display script > /proc/net/pktgen/pgrx

examples for transmitting can be found at the examples folder. For more details look at the pktgen documetation in the linux kernel *Documentation/networking/pktgen.txt*
