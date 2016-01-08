#!/bin/bash
#
# This program is written for helping CS50 studets to setup the apliance
# in their Ubuntu based machine.
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
#
echo "CS50 appliance installation is being process"
echo "========================================================================"
apt-get update && apt-get upgrade -y
apt-get install gdb clang make filezilla openjdk-7-jdk openjdk-7-jre nodejs astyle -y
echo "========================================================================"
echo "c compiler, default-jdk & jre and filezilla has been installed"
echo "========================================================================"
echo "Installing apache2, php5, mysql-server"
echo "========================================================================"
apt-get install apache2 -y && apt-get install php5 php5-curl php5-gmp php5-common php5-gd -y
echo "========================================================================"
apt-get install mysql-server -y
echo "========================================================================"
echo "apache2, php5, mysql-server has been installed"
echo "========================================================================"
apt-get install scratch -y
echo "========================================================================"
echo "MIT Scratch has been installed"
echo "========================================================================"
wget http://mirror.cs50.net/appliance50/2014/debs/dists/trusty/main/binary-i386/check50_1.19-2_i386.deb
wget http://mirror.cs50.net/appliance50/2014/debs/dists/trusty/main/binary-i386/render50_1.8-0_i386.deb
wget http://mirror.cs50.net/appliance50/2014/debs/dists/trusty/main/binary-i386/style50_2.1.4-1_i386.deb
echo "Download complete"
uname -a | grep arm && dpkg --force-architecture --force-depends -i check50_1.19-2_i386.deb || dpkg -i check50_1.19-2_i386.deb
echo "check50 done"
uname -a | grep arm && dpkg --force-architecture --force-depends -i style50_2.1.4-1_i386.deb || dpkg -i style50_2.1.4-1_i386.deb
echo "style50 done"
uname -a | grep arm && dpkg --force-architecture --force-depends -i render50_1.8-0_i386.deb || dpkg -i render50_1.8-0_i386.deb
echo "render50 done"
echo "========================================================================"
echo "check50, style50 and render50 has been installed"
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
wget http://mirror.cs50.net/appliance50/2014/debs/dists/trusty/main/binary-i386/library50-c_6-0_i386.deb
dpkg -i library50-c_6-0_i386.deb
rm library50-c_6-0_i386.deb
echo "========================================================================"
echo "custom C/C++ library has been configured"
echo "processing custom php library"
echo "========================================================================"
wget http://mirror.cs50.net/appliance50/2014/debs/dists/trusty/main/binary-i386/library50-php_4-0_i386.deb
dpkg -i library50-php_4-0_i386.deb
rm library50-php_4-0_i386.deb
echo "========================================================================"
echo "custom php library has been configured"
echo "Installing phpmyadmin and configuring SPL Library for CS50 Use"
echo "========================================================================"
apt-get install phpmyadmin -y
#echo "========================================================================"
#echo "
# My custom alias for CS50 By Harvard University
#make() {
# echo "cc -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1";
# cc -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1 ;
#}
#alias make=make" | cat >> ~/.bashrc
#echo "========================================================================"
#source ./.bashrc
echo "========================================================================"
wget https://github.com/tysonchamp/spl-for-ubuntu/archive/master.zip
unzip master.zip
cd spl-for-ubuntu-master
make
make install
echo "========================================================================"
chmod -R 777 /var/www/*
echo "Installation has been finished."
echo "CS50 README
============================================================================
1. Install Browser Addons:
============================================================================
After installation of apliance is finished, install the below addons in your
mozilla firefox web browser:
1) https://addons.mozilla.org/en-US/firefox/addon/1843
2) https://addons.mozilla.org/en-US/firefox/addon/3829
3) https://addons.mozilla.org/en-US/firefox/addon/60
2. Scratch:
============================================================================
Scratch Is already installed but still If you want to access the online 
version then visit below url: http://scratch.mit.edu/
3. Install Oracle Java:
============================================================================
If you wanna install through PPA, goto below url
http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
or,
download from official website
http://java.com/en/download/manual.jsp
Restart your System!"
