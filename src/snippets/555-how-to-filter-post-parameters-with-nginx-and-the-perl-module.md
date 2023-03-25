---
id: '555'
title: How to filter post parameters with nginx and the Perl module
languages:
- apacheconf
tags:
---
This example demonstrates how to inspect and filter POST parameters sent through nginx to a backend server with Perl:


```apacheconf
nginx => filter (perl) => backend
```
    

This could also be done with the Lua module.

nginx.conf:


```apacheconf
http {
    perl_modules  /tmp;
    perl_require  filter.pm;

    server {
		# The action we want to filter
		location = /bananas/create {
		  perl  filter::handler;
		}
		# The backend server
		location = /backend {
		    internal; # Only allowed internally
		    proxy_pass http://backend/bananas/create;
		}
		# The action that handles blocked requests
		location = /blocked {
		    internal;
		    perl filter::block;
		}
}
```
    

/tmp/filter.pm:


```apacheconf
package filter;
use nginx;

# Handle request
sub handler {
  my $r = shift;
  if ($r->has_request_body(\&checkRequest)) {
    return OK;
  }
  return OK;
}

# Print a message
sub blocked {
  my $r = shift;
  $r->send_http_header("text/html");
  $r->print("Blocked...\n<br/>");
  $r->rflush;
  return OK;
}

# Check request for invalid parameter
sub checkRequest {
  my $r = shift;
  my $body = $r->request_body;
  # Try to detect invalid POST parameters
  if ($body =~ /credit_card=/) {
     $r->internal_redirect("/blocked"); # Redirect to /blocked
  } else {
     $r->internal_redirect("/backend"); # Redirect to /backend
  }
  return OK;
}

1;
__END__
```
    

