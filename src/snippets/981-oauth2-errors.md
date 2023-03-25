---
id: '981'
title: OAuth2 errors
languages:
- bash
tags:
---
## OAuth2 errors

The list of OAuth2 errors can be found from the RFC:
https://www.rfc-editor.org/rfc/rfc6749#section-5.2

```bash
 invalid_request
       The request is missing a required parameter, includes an
       unsupported parameter value (other than grant type),
       repeats a parameter, includes multiple credentials,
       utilizes more than one mechanism for authenticating the
       client, or is otherwise malformed.

 invalid_client
       Client authentication failed (e.g., unknown client, no
       client authentication included, or unsupported
       authentication method).  The authorization server MAY
       return an HTTP 401 (Unauthorized) status code to indicate
       which HTTP authentication schemes are supported.  If the
       client attempted to authenticate via the "Authorization"
       request header field, the authorization server MUST
       respond with an HTTP 401 (Unauthorized) status code and
       include the "WWW-Authenticate" response header field
       matching the authentication scheme used by the client.

 invalid_grant
       The provided authorization grant (e.g., authorization
       code, resource owner credentials) or refresh token is
       invalid, expired, revoked, does not match the redirection
       URI used in the authorization request, or was issued to
       another client.

 unauthorized_client
       The authenticated client is not authorized to use this
       authorization grant type.

 unsupported_grant_type
       The authorization grant type is not supported by the
       authorization server.
```

## Solutions

- https://blog.timekit.io/google-oauth-invalid-grant-nightmare-and-how-to-fix-it-9f4efaf1da35
