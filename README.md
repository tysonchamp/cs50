# CS50

Hii all,

I just wrote this small BASH script to Setup CS50 Appliance in Host Machine (Ubuntu Family).
To use this script download the cs50.sh file and execute. It will install all the programs needed for CS50.

Please note: This script is only for 32bit version of Ubuntu, tested on 14.04, Raspberry Pi 2 Ubuntu Edition & 13.10(server). If you are looking for instruction on 64bit version go here (http://cs50.stackexchange.com/questions/1459/how-to-install-the-tools-for-the-course-on-ubuntu) and check Atul Gangwar's answer. And for the webserver default configuration is unchanged and the default directory is /var/www/html.

for the Stanford Portable Library check out here (repository by Prof. David J. Malan) : https://github.com/cs50/spl 

To execute follow the below steps:

sh ./cs50.sh

To become root you may use "sudo su" in your terminal then enter your password.

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
