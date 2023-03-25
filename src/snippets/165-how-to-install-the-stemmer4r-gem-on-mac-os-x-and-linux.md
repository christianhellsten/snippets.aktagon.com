---
id: '165'
title: How to install the stemmer4r gem on Mac OS X and Linux
languages:
- ruby
tags:
---
The stemmer4r gem is fubar. Warning draft snippet...


```ruby
# gem install stemmer4r
Bulk updating Gem source index for: http://gems.rubyforge.org
Building native extensions.  This could take a while...
ERROR:  While executing gem ... (Gem::Installer::ExtensionBuildError)
    ERROR: Failed to build gem native extension.

ruby extconf.rb install stemmer4r

Gem files will remain installed in /usr/lib/ruby/gems/1.8/gems/stemmer4r-0.6 for inspection.
Results logged to /usr/lib/ruby/gems/1.8/gems/stemmer4r-0.6/ext/stemmer4r/gem_make.out


1. Change path of Ruby executable

cd /usr/lib/ruby/gems/1.8/gems/stemmer4r-0.6/ext/stemmer4r/
vim extconf.rb

#!/usr/bin/ruby -w

to

#ruby -w

2. Compile libstemmer_c

cd /usr/lib/ruby/gems/1.8/gems/stemmer4r-0.6/ext/stemmer4r/libstemmer/
make

3. Compile stemmer4r

cd /usr/lib/ruby/gems/1.8/gems/stemmer4r-0.6/ext/stemmer4r/

Change path:
/usr/local/ruby/lib/ruby/1.8/i686-linux/
To:
/usr/lib/ruby/1.8/x86_64-linux/

Or wherever you have it installed

ruby extconf.rb


4. Build stemmer4r gem


gem build stemmer4r.gemspec

gem install stemmer4r-0.6.gem


Problems

gcc -shared -rdynamic -Wl,-export-dynamic   -L"/usr/lib" -o stemmer4r.so stemmer4r.o libstemmer_c/libstemmer.o  -lruby1.8  -lpthread -ldl -lcrypt -lm   -lc
/usr/bin/ld: libstemmer_c/libstemmer.o(libstemmer.o): relocation R_X86_64_32 against a local symbol' can not be used when making a shared object; recompile with -fPIC
libstemmer_c/libstemmer.o: could not read symbols: Bad value
collect2: ld returned 1 exit status
make: *** [stemmer4r.so] Error 1


Add CFLAGS:

root@aktagon:/usr/lib/ruby/gems/1.8/gems/stemmer4r-0.6/ext/stemmer4r/libstemmer_c# make
include mkinc.mak
CFLAGS   =  -fPIC
libstemmer.o: $(snowball_sources:.c=.o)
        $(AR) -cru $@ $^
```
    

