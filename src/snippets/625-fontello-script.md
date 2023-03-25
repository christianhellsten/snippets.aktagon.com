---
id: '625'
title: Fontello script
languages:
- makefile
tags:
---
Easily download and install Fontello font icons with this makefile; no more manual downloading and copying:


```makefile
#
# Easily download and install Fontello font icons.
#
# Original version:
# https://gist.github.com/puzrin/5537065
#
 
# Note this directory will be deleted
TMP_DIR      ?= ./tmp/fontello
# The Fontello config.json file
CONF_FILE    ?= ./config/fontello.json
# Where do you want the font files to be?
FONT_DIR     ?= ./public/font
# Where do you want the CSS files to be?
CSS_DIR      ?= ./app/css/vendor
 
### Don't edit below ###
 
FONTELLO_HOST ?= http://fontello.com
 
download:
	@if test ! which curl ; then \
		echo 'Install curl first.' >&2 ; \
		exit 128 ; \
		fi
	curl --silent --show-error --fail --output .fontello \
		--form "config=@${CONF_FILE}" \
		${FONTELLO_HOST}
	open ${FONTELLO_HOST}/cat .fontello

install:
	@if test ! which unzip ; then \
		echo 'Install unzip first.' >&2 ; \
		exit 128 ; \
		fi
	@if test ! -e .fontello ; then \
		echo 'Run make fontopen first.' >&2 ; \
		exit 128 ; \
		fi
	rm -rf ${TMP_DIR} .fontello.zip
	curl --silent --show-error --fail --output .fontello.zip \
		${FONTELLO_HOST}/cat .fontello/get
	unzip .fontello.zip -d ${TMP_DIR}
	mkdir -p ${FONT_DIR}
	mkdir -p ${CSS_DIR}
	cp -R ${TMP_DIR}/*/font/* ${FONT_DIR}
	cp -R ${TMP_DIR}/*/css/* ${CSS_DIR}
	rm -rf ${TMP_DIR} .fontello.zip
```
    

