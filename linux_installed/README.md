# Summary

# SecureConnector Managed
## Summary
Forescout supports both Debian/Ubuntu and RedHat/CentOS Operating Systems for the SecureConnector. For the currently supported versions, please see: https://www.forescout.com/company/resources/forescout-compatibility-matrix/

Debian based Linux distributions (Ubuntu, Kali, Mint, etc.) leverage APT for installation and RedHat based Linux Distributions (Fedora, SUSE RHEL, CentOS, etc) leverage YUM for installation. There are two scripts, one for each package management system.

## APT Based Installed Packages
Leverages the script "apt_installed_packages.sh" to query the APT database for all installed packages.
Import the XML file "APT Installed Packages -- SC Based.xml" and import the above script into the policy to query APT based machines with the SecureConnector Installed.

## Yum Based Installed Packages
Leverages the script "yum_installed_packages.sh" to query the YUM database for all installed packages.
Import the XML file "Yum Installed Packages -- SC Based.xml" and import the above script into the policy to query YUM based machines with the SecureConnector installed. 

# Linux Server Agent Managed

With the introduction of the Linux Server Agent in 8.2.2 scripts that check for the status of "SecureConnector Managed" need to change to leverage the Linux Server Agent. We will leverage the "Linux Server Expected Script Result" condition instead of "SecureConenctor Managed." The scripts will be copied over to the local endpoint and run from the /tmp location unless otherwise specificed.

