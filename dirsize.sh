#!/bin/bash

printf "Before executing this script please ensure that you have cloned down the PHP files\nin the following github repo and the files are in the WordPress root directory of all\nof the installs being analyzed.\r\n"
printf "\r\nTo clone simply run the following command either before or during deployment:\r\n\r\n"
printf '\e[1;31m%-6s\e[m' "git clone https://github.com/robertliwpe/disksize.git"

printf "\r\n\r\n=====================================================================================\r\n"

echo "Please list your installs with spaces between:"

read installist 

for i in $installist; do echo "Total File System Size for Install: $i" && ssh $i@$i.ssh.wpengine.net "cd ~/sites/$i &&  wp eval-file ./dirsizebytes.php" ; done


