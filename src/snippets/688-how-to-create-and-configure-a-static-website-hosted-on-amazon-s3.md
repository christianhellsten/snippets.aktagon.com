---
id: '688'
title: How to Create and Configure a Static Website Hosted on Amazon S3
languages:
- bash
tags:
---
This will create two S3 buckets and configure them for hosting a static website:


```bash
aws s3 mb s3://xxx.com
aws s3 mb s3://www.xxx.com

aws s3api put-bucket-website --bucket www.xxx.com --website-configuration '{
    "RedirectAllRequestsTo": {
        "HostName": "xxx.com"
    }
}'

aws s3api put-bucket-website --bucket xxx.com --website-configuration '{
    "IndexDocument": {
        "Suffix": "index.html"
    },
    "ErrorDocument": {
        "Key": "404/index.html"
    }
}'

aws s3api get-bucket-website --bucket www.xxx.com
aws s3api get-bucket-website --bucket xxx.com
```
    

Next, allow anyone to access the files:


```bash
aws s3api put-bucket-policy --bucket www.xxx.com --policy '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::www.xxx.com/*"
    }
  ]
}'
```
    

Next, upload your website to S3:


```bash
aws s3 sync build s3://www.xxx.com --acl public-read --delete
```
    

In the above example all files are located in a folder named build.

Done. Your website can be found at http://<bucket name>.s3.amazonaws.com/index.html.

Note:
\* if you're serious about hosting your website, use AWS Cloudfront or Cloudflare + S3
\* the "www" URL redirects to the "non-www" URL

