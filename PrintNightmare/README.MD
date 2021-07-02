# PrintNightmare

## Use Case

CVE-2021-1675 is a vulnerability that allows for elevation of privilege through the Windows Print Spooler (see <https://nvd.nist.gov/vuln/detail/CVE-2021-1675>). There was a patch released around this vulnerability but since then additional information has been released that demonstrates this still exists (<https://www.rapid7.com/blog/post/2021/06/30/cve-2021-1675-printnightmare-patch-does-not-remediate-vulnerability/>). Researchers expect that since the Print Spooler Service is enabled by default on Windows Server on every version except for Windows Server Core. All Domain Controllers including those patched are vulnerable to this code.

The recommend solution is to stop the Print Spooler Service.

### The Policy

This poliy is built around three different sub-rules:

- Check for Domain Controllers

  - Leverages the Function Classification to only go after Servers
  - Forescout doesn't flag a Server as a Domain Controller, so we need to run a script via WMI to query if it is a Domain Controller (domaincontroller.vbs)
  - Check to see to see if the Print Spooler Service is running on a machine
  - Stops the Print Spooler Service and changes startup to Disabled via a script (spooler.vbs)
  - An immediate recheck could be added as an action to clear this error message

- Check for Servers
  
  - Leverages the Function Classification for Servers
  
  - Checks to see if the Print Spooler Service is running

  - Stops the Print Spooler Service and changes startup to Disabled via a script (spooler.vbs)
  
  - An immediate recheck could be added as an action to clear this error message

- Regular Computers
  
  - Leverages the Function Classification for Computers
  
  - Checks to see if the Printer Spooler Service is running
  
  - Stops the Print Spooler Service and changes startup to Disabled via a script (spooler.vbs)
  
  - An immediate recheck could be added as an action to clear this error message

## Needed for the policy

There is a heavy reliance on scripts as a part of this policy set

-domaincontroler.vbs

- Checks to see if the machine is a Domain Controller or not

-spooler.vbs

- Stops the Print Spooler Service and changes startup to disabled
 