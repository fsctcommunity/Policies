# Exact Windows Version

There are two policies attached in XML format for this policy: Windows 10 Versions and Windows Server Versions

## Use Case

This policy focus on detecting the exact version of Windows 10 and marking whether a device is compliant based supported Windows versions. THis policy was published 1st on the Forescout Community Slack and then merged with a policy from Forescout as well.


The policy runs a script to grab the Windows Version and then based on the output will put it into various Groups to allow for better reporting and gathering. 

As Microsoft releases additional versions, this policy will need to be modified.

Unsupported versions of Windows are added to the "unsupported windows" group and supported versions are added to the "supported windows" group.

## Needed for the policy

There are two XML files based on the version (Client vs. Server) that is being tracked, also there is a winver.bat file that is needed to run as a script.
