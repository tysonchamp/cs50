# CS50

Hii all,

I just wrote this small BASH script to Setup CS50 Appliance in Host Machine (Ubuntu Family).
To use this script download the cs50.sh file and execute. It will install all the programs needed for CS50.

Please note: This script is only for 32bit version of Ubuntu, tested on 14.04, Raspberry Pi 2 Ubuntu Edition & 13.10(server). If you are looking for instruction on 64bit version go here (http://cs50.stackexchange.com/questions/1459/how-to-install-the-tools-for-the-course-on-ubuntu) and check Atul Gangwar's answer. And for the webserver default configuration is unchanged and the default directory is /var/www/html.

Stanford Portable Library (repository by Prof. David J. Malan https://github.com/cs50/spl ) now will be auto installed.

To execute follow the below steps:

First Create a Github Account and generate a ssh key for your account. Follow below links for detailed steps

https://help.github.com/articles/generating-ssh-keys/#platform-linux

Then execute below commands one by one with root access


      sudo su
      
      apt-get install -y build-essential git
      
      git clone git@github.com:tysonchamp/cs50.git
      
      cd cs50
      
      sh cs50.sh


After it finish copy the below codes and paste it in your .bashrc file, its available in your home directory. If the file is not visible then, right click -> show hidden.


      make() {
      
      echo "cc -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1";
      
      cc -ggdb -std=c99 -Wall -Werror ${1}.c -lcrypt -lcs50 -lm -o $1 ;
      
      }
      
      alias make=make


After you paste the above codes run source ./.bashrc in terminal.

Credit: 
Thanks to all the CS50 FB Group Members and CS50 Team.

Changes:

02.02.2015

1. Removed CS50 repository.
2. check50, style50 and render50 installation fixed.

27.02.2015

1. Added configuration into the .bashrc for make to link cs50 library.

01.03.2015

1. Fixed minor bugs. Thanks to theSilentStrom for informing.

02.03.2015

1. Updated readme (added instruction for 64bit version of Ubuntu).

03.05.2015

1. Added support for Raspberry Pi 2 Ubuntu Edition by damian1baran

15.12.2015

1. Included SPL (Stanford Portable Library) for auto installation

08.01.2016

1. Added MIT Scratch program installation
