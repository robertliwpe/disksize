# WP Engine WordPress Instal File System Size Checker
### Note: this ONLY works with the WP Engine platform.

Given that storage is only updated on a weekly basis on the WP Engine user portal and command line access on the WP Engine platform is restricted via an SSH gateway bastion host, users who wish to either programmatically retrieve this information, or retrieve on on demand will need to configure the following solution.

### Version 2.0 Released 

Version 2.0 is now able to fully function from your local terminal. As long as you have set up your SSH Gateway to your WP Engine account correctly (refer below), and you have `chmod +x disksizeauto.sh` the file, simply execute, and it will loop through your installs to provide you file system size in Bytes.

***Right Click to Download it: https://github.com/robertliwpe/disksize/raw/main/dirsizeauto.sh***

### Version 1.0 Steps (Please Read First)

Firstly, ensure that you have properly configured SSH Gateway access for your WP Engine account: https://wpengine.com/support/ssh-gateway/

Before locally executing the included `disksize.sh` script in terminal/CLI please ensure that you have cloned down the PHP files in this github repo and ***those files are in the WordPress root directory of all of the installs being analyzed.***

To clone simply run the following command either before or during deployment in your CI/CD pipeline (`git clone` cannot be run on a WP Engine server):

`git clone https://github.com/robertliwpe/disksize.git`

(An alternative solution is to upload the PHP files directly into the WordPress Install root directory using SFTP: https://wpengine.com/support/sftp/).

Lastly, download the `dirsize.sh` file to your local machine and execute it in terminal/CLI (e.g. `./disksize.sh`). This is loopable, ensure that you list installs separated by a space. If it is not correctly executing ensure you have already changed permissions of it with `chmod +x disksize.sh`

If you have also deployed the `dirsize.php` file into the root directory of the WordPress install you can also access this information in browser e.g. `https://www.example.com/dirsize.php`

An example of the browser output can be found here: http://robertliwpe.wpengine.com/dirsize.php


