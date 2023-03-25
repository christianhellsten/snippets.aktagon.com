---
id: '846'
title: How to SSH with Go
languages:
- bash
- go
tags:
---
How to SSH with Go.

main.go:

```go
package main

import (
	"bytes"
	"flag"
	"golang.org/x/crypto/ssh"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

var host string
var port string
var user string
var command string
var keyPath string
var keyPass string

func init() {
	flag.StringVar(&host, "host", "", "SSH hostname or IP")
	flag.StringVar(&port, "port", "", "SSH port")
	flag.StringVar(&user, "user", "", "SSH user")
	flag.StringVar(&command, "command", "", "Command to execute on server")
	flag.StringVar(&keyPath, "key-path", "", "For example, ~/.ssh/id_rsa")
	flag.StringVar(&keyPass, "key-password", "", "Password for private key (optional)")
	flag.Parse()
	if host == "" || port == "" || command == "" || user == "" || keyPath == "" {
		flag.PrintDefaults()
		os.Exit(2)
	}
}

func readPubKey(file string) ssh.AuthMethod {
	var key ssh.Signer
	var err error
	var b []byte
	b, err = ioutil.ReadFile(file)
	mustExec(err, "failed to read public key")
	if !strings.Contains(string(b), "ENCRYPTED") {
		key, err = ssh.ParsePrivateKey(b)
		mustExec(err, "failed to parse private key")
	} else {
		key, err = ssh.ParsePrivateKeyWithPassphrase(b, []byte(keyPass))
		mustExec(err, "failed to parse password-protected private key")
	}
	return ssh.PublicKeys(key)
}

func main() {
	conf := &ssh.ClientConfig{
		User: user,
		Auth: []ssh.AuthMethod{
			readPubKey(keyPath),
		},
		HostKeyCallback: ssh.InsecureIgnoreHostKey(), // XXX: Security issue
	}
	client, err := ssh.Dial("tcp", strings.Join([]string{host, ":", port}, ""), conf)
	mustExec(err, "failed to dial SSH server")
	session, err := client.NewSession()
	mustExec(err, "failed to create SSH session")
	defer session.Close()
	var b bytes.Buffer
	session.Stdout = &b
	err = session.Run(command)
	mustExec(err, "failed to run command over SSH")
	log.Printf("%s: %s", command, b.String())
}

func mustExec(err error, msg string) {
	if err != nil {
		log.Fatalf("%s:\n  %s", msg, err)
	}
}
```

This command will run a command on a remote SSH server:
```bash
go run main.go -command whoami -host bush.com -key-path ~/.ssh/id_rsa -port 22 -user jeb
```

Also see:
- https://github.com/golang/crypto/blob/master/ssh/example_test.go
- https://blog.ralch.com/tutorial/golang-ssh-connection/
