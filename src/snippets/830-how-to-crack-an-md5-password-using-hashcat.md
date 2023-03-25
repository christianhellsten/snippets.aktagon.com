---
id: '830'
title: How to crack an MD5 password using hashcat
languages:
- bash
tags:
---
### Brute-force attack

Install hashcat:

```bash
brew install hashcat
```

Write the MD5 hashes that we want hashcat to crack for us to a file:

```bash
echo '098f6bcd4621d373cade4e832627b4f6' >> hashes
echo '1a1dc91c907325c69271ddf0c944bc72' >> hashes
```

Attempt to crack MD5 password hash using brute force ("-a 3" switch):

```bash
$ hashcat -a 3 hashes
```

Show cracked hashes and passwords:

```bash
$ hashcat -a 3 hashes --show
098f6bcd4621d373cade4e832627b4f6:test
1a1dc91c907325c69271ddf0c944bc72:pass
```

## Dictionary attack

Download a dictionary:

```bash
wget https://raw.githubusercontent.com/berzerk0/Probable-Wordlists/master/Real-Passwords/Top196-probable.txt
```

Write the MD5 hashes that we want hashcat to crack for us to a file:

```bash
echo '5f4dcc3b5aa765d61d8327deb882cf99' >> hashes
```

Attempt to crack the password using the dictionary:

```bash
hashcat -a 0 hashes Top196-probable.txt
```

Show cracked hashes and passwords:

```bash
$ hashcat -a 3 hashes --show
5f4dcc3b5aa765d61d8327deb882cf99:password
```

### How to decode base64 encoded MD5 password hash

To decode a base64 encoded MD5 password hash you can use these commands:

```bash
echo -n 'base64-encoded-md5-password' | base64 -D | xxd -g 0 -ps > hashes
```

Tested with hashcat v4.0.1.
