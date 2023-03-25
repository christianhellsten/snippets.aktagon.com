---
id: '679'
title: How to use the AWS Command Line Interface
languages:
- bash
tags:
---
How to use the [AWS Command Line Interface Documentation](http://aws.amazon.com/documentation/cli/).

AWS CLI doesn't support Cloudfront at the moment, see list of [supported services](http://aws.amazon.com/cli/#Supported_Services) for details.

### Install the Amazon AWS command line client


```bash
$ pip install awscli
# or
$ sudo easy_install awscli
```
    

Now you need to configure the client:


```bash
$ aws configure
```
    

### How to create an S3 bucket


```bash
aws s3 mb s3://xxx
```
    

### How to list S3 buckets


```bash
$ aws s3 ls
```
    

### How to configure a website


```bash
$ aws s3 website help
```
    

### How to configure the index and error documents of a website


```bash
aws s3api put-bucket-website --bucket xxx.com --website-configuration '{
    "IndexDocument": {
        "Suffix": "index.html"
    },
    "ErrorDocument": {
        "Key": "404/index.html"
    }
}'
```
    

### How to set the website policy


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
    

### How to get the website configuration


```bash
$ aws s3api get-bucket-website --bucket x.com
```
    

### How to configure redirection for your website

This creates a redirection from x.com to www.x.com:


```bash
aws s3api put-bucket-website --bucket x.com --website-configuration '{
    "RedirectAllRequestsTo": {
        "HostName": "www.x.com"
    }
}'
```
    

### How to set the error document


```bash
$ aws s3 website s3://xxx --index-document index.html --error-document 404/index.html
```
    

### How to upload a website to S3


```bash
$ aws s3 sync ~/xxx s3://xxx --delete --cache-control \"max-age=3600\" --acl public-read --exclude *.txt
```
    

Note that the command will:
\* delete files from S3 that don't exist locally.
\* set max-age header to 3600
\* allow anyone to access the files
\* exclude \*.txt files

