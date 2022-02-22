# Linux Installed Packages

## Use Cases

Forescout supports both Debian/Ubuntu and RedHat/CentOS Operating Systems for the SecureConnector. For the currently supported versions, please see: <https://www.forescout.com/company/resources/forescout-compatibility-matrix/>

Debian based Linux distributions (Ubuntu, Kali, Mint, etc.) leverage APT for installation and RedHat based Linux Distributions (Fedora, SUSE RHEL, CentOS, etc) leverage YUM for installation. There are two scripts, one for each package management system.

### APT Based Installed Packages

Leverages the script "apt_installed_packages.sh" to query the APT database for all installed packages.
Import the XML file "APT Installed Packages -- SC Based.xml" and import the above script into the policy to query APT based machines with the SecureConnector Installed.

### Yum Based Installed Packages

Leverages the script "yum_installed_packages.sh" to query the YUM database for all installed packages.
Import the XML file "Yum Installed Packages -- SC Based.xml" and import the above script into the policy to query YUM based machines with the SecureConnector installed.


## Needed for the policy

There are two scripts and two policies for this, a set for each type of package installer tool (YUM and APT), import the policy and script you need to get the information.