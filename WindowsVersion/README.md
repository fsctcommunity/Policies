# Policy Overview
This policy focus on detecting the exact version of Windows 10 and marking whether a device is compliant based supported Windows versions. THis policy was published 1st on the Forescout Community Slack and then merged with a policy from Forescout as well.


The policy runs a script to grab the Windows Version and then based on the output will put it into various Groups to allow for better reporting and gathering. 

As Microsoft releases additional versions, this policy will need to be modified.

An additional thought is we could create a group of "Unsupported Windows Versions" as versions come in and out of support.
