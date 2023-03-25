---
id: '681'
title: How to configure a no-www redirection on Amazon AWS (S3 and Cloudfront)
languages:
- bash
tags:
---
How do you configure a site hosted on Amazon AWS, e.g. a static website, to redirect from "www" to the "no-www" domain (aka "naked domain")? The tool for the job is [the AWS CLI](http://docs.aws.amazon.com/cli/latest/reference/s3api/).

For example, this creates a redirection from www.x.com to x.com for a bucket named www.x.com:


```bash
aws s3api put-bucket-website --bucket www.x.com --website-configuration '{
    "RedirectAllRequestsTo": {
        "HostName": "x.com"
    }
}'
```
    

Use this command to check that the configuration is set properly:


```bash
aws s3api get-bucket-website --bucket www.x.com
```
    

