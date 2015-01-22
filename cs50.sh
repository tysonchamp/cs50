#!/bin/bash
#
# This program is written for helping CS50 studets to setup the apliance
# in their virtual host. 
#
# Copyright 2014 tysonchamp <tyson.granger181@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#
echo "CS50 appliance installation is being process"
# Download and Add the GNUPG key for the repo
wget -q -O - http://mirror.cs50.net/appliance50/2014/debs/keyFile | sudo apt-key add -
# Add the repository of CS50
sudo add-apt-repository "deb http://mirror.cs50.net/apliance50/2014/debs/dists/trusty/main/binary-i386 /"
echo "========================================================================"
apt-get update && apt-get upgrade -y
apt-get install clang make filezilla default-jdk default-jre -y
echo "========================================================================"
echo "gcc and filezilla has been installed"
echo "========================================================================"
apt-get install check50 style50 render50 -y
echo "========================================================================"
echo "check50, style50 and render50 has been installed"
echo "Installing apache2, php5, mysql-server"
echo "========================================================================"
apt-get install apache2 php5 php5-curl php5-gmp -y && apt-get install mysql-server -y
echo "========================================================================"
echo "apache2, php5, mysql-server has been installed"
echo "Installing python and ruby"
echo "========================================================================"
apt-get install python python-setuptools ruby -y
easy_install pip
su - -c "pip install cs50"
gem install cs50
echo "========================================================================"
echo "python & ruby have been instaled"
echo "custom python and ruby libraries have been configured"
echo "========================================================================"
echo "Installing custom C/C++ and php libraries"
echo "========================================================================"
wget http://mirror.cs50.net/library50/c/library50-c-5.zip
unzip library50-c-5.zip
rm -f library50-c-5.zip
cd library50-c-5
gcc -c -ggdb -std=c99 cs50.c -o cs50.o
ar rcs libcs50.a cs50.o
chmod 0644 cs50.h libcs50.a
mkdir -p /usr/local/include
chmod 0755 /usr/local/include
mv -f cs50.h /usr/local/include
mkdir -p /usr/local/lib
chmod 0755 /usr/local/lib
mv -f libcs50.a /usr/local/lib
cd ..
rm -rf library50-c-5
echo "========================================================================"
echo "custom C/C++ library has been configured"
echo "processing custom php library"
echo "========================================================================"
wget http://mirror.cs50.net/library50/php/library50-php-4.zip
unzip library50-php-4.zip
rm -f library50-php-4.zip
chmod -R a+rX library50-php-4
mkdir -p /usr/share/php
mv library50-php-4/CS50 /usr/share/php/
rm -rf library50-php-4
echo "========================================================================"
echo "custom php library has been configured"
echo "Installing phpmyadmin"
echo "========================================================================"
apt-get install phpmyadmin -y
echo "========================================================================"
echo "Installation has been finished"
echo "CS50 README
============================================================================

1. Install Browser Addons:
============================================================================
After installation of apliance is finished, install the below addons in your
mozilla firefox web browser:

1) https://addons.mozilla.org/en-US/firefox/addon/1843
2) https://addons.mozilla.org/en-US/firefox/addon/3829
3) https://addons.mozilla.org/en-US/firefox/addon/60


2. Setup Scratch:
============================================================================
If you have added the  all the aadons, now install the scratch (optional)
goto below url for manuals:
http://scratch.mit.edu/scratch2download/

or,

If you want to access the online version then visit below url:
http://scratch.mit.edu/


3. Install Oracle Java:
============================================================================
If you wanna install through PPA, goto below url
http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html

or,

download from official website
http://java.com/en/download/manual.jsp"
