---
id: '859'
title: How to view the client certificates accepted by a website
languages:
- bash
tags:
---
To view a list of acceptable client certificates, execute:

```bash
$ openssl s_client -connect golang.org:443
```

The output is a list of acceptable CA names:
```bash
... 
---
Acceptable client certificate CA names
/C=FI/ST=Finland/O=Vaestorekisterikeskus CA/OU=XYZ/CN=ÅÄÖ
---
... 
```

or, if no client certificates are accepted:

```bash
... 
---
No client certificate CA names sent
---
... 
```

To log client certificate information with haproxy:

```
  bind *:443 ssl crt xyz.com.pem ca-file vrk-ca.pem verify optional crt-ignore-err all crl-file vrk-revocation-list.pem
  # See https://www.haproxy.com/blog/ssl-client-certificate-information-in-http-headers-and-logs/
  http-request set-header X-SSL                  %[ssl_fc]
  http-request set-header X-SSL-Client-Verify    %[ssl_c_verify]
  http-request set-header X-SSL-Client-DN        %{+Q}[ssl_c_s_dn]
  http-request set-header X-SSL-Client-CN        %{+Q}[ssl_c_s_dn(cn)]
  http-request set-header X-SSL-Issuer           %{+Q}[ssl_c_i_dn]
  http-request set-header X-SSL-Client-NotBefore %{+Q}[ssl_c_notbefore]
  http-request set-header X-SSL-Client-NotAfter  %{+Q}[ssl_c_notafter]

  log-format "%ci:%cp [%t] %ft %b/%s %Tq/%Tw/%Tc/%Tr/%Tt %ST %B %CC %CS %tsc %ac/%fc/%bc/%sc/%rc %sq/%bq %hr %hs {%[ssl_c_verify],%{+Q}[ssl_c_s_dn],%{+Q}[ssl_c_i_dn]} %{+Q}r"
```

Also see https://tools.ietf.org/html/rfc5246#page-53
