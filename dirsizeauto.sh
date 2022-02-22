#!/bin/bash
printf "\r\n\r\n"
printf '\e[1;34m%-6s\e[m' "WP Engine Local Install Storage Analyzer"

printf "\r\n\r\n=====================================================================================\r\n\r\n"

printf "Ensure that SSH Gateway access has been properly configured for your WP Engine Account \r\n\r\nhttps://wpengine.com/support/ssh-gateway/\r\n\r\n"
printf "If a prompt to add the install to known hosts occurs type YES and press enter.\r\n\r\n"

printf "This script will clone a PHP file from the following github repo to the WordPress root \r\ndirectory of all installs being analyzed, provide storage used in BYTES and then remove.\r\n\r\n"
printf '\e[1;31m%-6s\e[m' "To clone the repo yourself use: git clone https://github.com/robertliwpe/disksize.git"

printf "\r\n\r\n=====================================================================================\r\n"

echo "Please list your installs with spaces between:"

read installist 

for i in $installist; do echo "Total File System Size for Install: $i" && ssh $i@$i.ssh.wpengine.net "cd ~/sites/$i && wget --quiet https://robertliwpe.wpengine.com/dirsizebytes && mv dirsizebytes dirsizebytes.php && wp eval-file ./dirsizebytes.php && rm ./dirsizebytes.php" ; done


#!/bin/bash
printf "\r\n\r\n"
printf '\e[1;34m%-6s\e[m' "WP Engine Local Install Storage Analyzer"

printf "\r\n\r\n=====================================================================================\r\n\r\n"

printf "Ensure that SSH Gateway access has been properly configured for your WP Engine Account \r\n\r\nhttps://wpengine.com/support/ssh-gateway/\r\n\r\n"
printf "If a prompt to add the install to known hosts occurs type YES and press enter.\r\n\r\n"

printf "This script will clone a PHP file from the following github repo to the WordPress root \r\ndirectory of all installs being analyzed, provide storage used in BYTES and then remove.\r\n\r\n"
printf '\e[1;31m%-6s\e[m' "To clone the repo yourself use: git clone https://github.com/robertliwpe/disksize.git"

printf "\r\n\r\nThere is also the option to deposit a web readout version accessible by browser \r\nNOTE: The web readout version may require refreshing before it is accurate.\r\n"

printf "\r\n=====================================================================================\r\n"

echo "Would you like a web readout as well as this command line output (yes OR no)?"

read webversion

printf "\r\nPlease list your installs with spaces between:\r\n"

read installist 

confirm="yes"

if [[ "$webversion" == "$confirm" ]]
then
	for i in $installist; do echo "Total File System Size for Install: $i" && ssh $i@$i.ssh.wpengine.net "cd ~/sites/$i && wget --quiet https://robertliwpe.wpengine.com/dirsizebytes && mv --force dirsizebytes dirsizebytes.php && wp eval-file ./dirsizebytes.php 2>/dev/null && rm ./dirsizebytes.php && wget --quiet https://robertliwpe.wpengine.com/dirsize && mv --force dirsize dirsize.php" && echo "Please access the web readout by visiting http://$i.wpengine.com/dirsize.php"; done
else
	for i in $installist; do echo "Total File System Size for Install: $i" && ssh $i@$i.ssh.wpengine.net "cd ~/sites/$i && wget --quiet https://robertliwpe.wpengine.com/dirsizebytes && mv --force dirsizebytes dirsizebytes.php && wp eval-file ./dirsizebytes.php 2>/dev/null && rm ./dirsizebytes.php"; done
fi
