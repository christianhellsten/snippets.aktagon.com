---
id: '793'
title: Debugging tools
languages:
- bash
tags:
---
## IO and system calls

- dstat

Monitor network and disk IO:
```bash
dstat -t
```

- dtrace / dtruss (OSX)

To get the list of available system calls use:

```bash
sudo dtrace -ln 'syscall:::entry'
```

Find which files a program is opening (same as *strace -f -p $PID -e open*):
```bash
sudo dtruss -t open_nocancel -p $PID
```

Also see *ls /usr/bin/*.d*

- strace (Linux)

Monitor system calls made by an app:

```bash
strace ruby app.rb
```

Writes all system calls made by SSH, and subprocesses (-f), to a file named ssh.txt:

```bash
strace -f -o ssh.txt ssh jebus.com
```

Spy on all 'open' system calls made by a process:

```bash
strace -f -p $PID -e open
```

Use these commands to see a list of all available system calls (Linux only):

```bash
man syscalls
```

- opensnoop

Monitor what files are being opened:

```bash
opensnoop -p $PID
strace -e open -p $PID
```

## Networking

- netcat

Pipe/copy data over a network:
```bash
cat request.txt | nc metafilter.com 80
```

- netstat

Find which programs are listening to which port:

```bash
sudo netstat -tunapl
lsof -i -P # OSX
```

- ngrep

Listen to traffic containing the string "localhost" on any network interface:

```bash
sudo ngrep -d any localhost
```

- tcpdump

Listen to traffic containing the string "localhost" on any network interface:

```bash
sudo tcpdump port 80 -w http.pcap
```

Writes a pcap file that can be analyzed with Wireshark.

- Wireshark

Analyze pcap files from ngrep, tcpdump, etc:

```bash
wireshark http.pcap
```

## CPU (Linux)

- perf

Run perf, a sampling profiler, to see where your application is spending its time:

```bash
sudo perf record ruby app.rb
```

Find out what the program using the most CPU time is doing:

```bash
sudo perf top
```

Find out if an app is using the L1 cache which is ~200 times faster than RAM:

```bash
sudo perf stat -e L1-dcache-load-misses my_golang_app
```

## References

- http://jvns.ca/debugging-zine.pdf
- https://8thlight.com/blog/colin-jones/2015/11/06/dtrace-even-better-than-strace-for-osx.html
