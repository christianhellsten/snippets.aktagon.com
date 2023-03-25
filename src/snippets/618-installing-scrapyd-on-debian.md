---
id: '618'
title: Installing Scrapyd on Debian
languages:
- bash
tags:
---
Install Debian pre-requisites
-----------------------------


```bash
sudo apt-get install python-pip python-dev
# Scrapyd image module requirements
sudo apt-get install libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev
```
    

Install Python libraries

Customize for your project:


```bash
sudo pip install unidecode mysql-python pyes pil
```
    

Use pip freeze if you want:


```bash
pip freeze > requirements.txt
```
    

Install scrapy


```bash
git clone https://github.com/scrapy/scrapy.git
cd scrapy
sudo python setup.py install
```
    

Install scrapyd


```bash
git clone https://github.com/scrapy/scrapyd.git
cd scrapyd
sudo python setup.py install
```
    

Deploy project to Scrapyd (http://localhost:6800)


```bash
cd project
scrapy deploy
```
    

Run


```bash
- Start a spider
curl http://localhost:6800/schedule.json -d project=default -d spider=xxx

- List spiders
curl http://localhost:6800/listspiders.json?project=default

- List jobs
curl http://localhost:6800/listjobs.json?project=default

- Cancel job
curl http://localhost:6800/cancel.json -d project=default -d job=4abb6c78fd1a11e28ed9fefdb24fae0a
```
    

