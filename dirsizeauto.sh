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


