# Domain Conterollers

## Use Case

Out of the box, Forescout does not mark or classify a Windows Server differently if it is a domain controller (DC) or not. There are multiple ways to detect if a machine is a DC, either by running a script to query the type of DC, or by looking for specific services.

Since most people do not like running automated scripts against a DC, this policy checks to see if the Active Directory Domain Services service exists on a machine. If so, the Machine is added to a group, which can then be used by another policy.

An example of a policy leveraging this DC Group is the PrintNightmare policy which checked for a specific CVE (CVE-2021-1675).

## Needed for the policy

Need for this policy is the "Domain Controller Servers.xml" file which can then be imported into Forescout.
