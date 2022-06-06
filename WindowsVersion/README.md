# Exact Windows Version

There are two policies attached in XML format for this policy: Supported Windows Desktop Versions and Supported Windows Server Versions

## Use Case

This policy focus on detecting the exact version of Windows 10 and marking whether a device is compliant based supported Windows versions. This policy was published in the Forescout Community Slack (https://www.forescoutcommunity.com/) and then published on the Github

As Microsoft releases additional versions, this policy will need to be modified.

The policy is using the "Windows Version Fine-tuned" attribute to look at specific versions of Windows 10 and Windows 11 (as more vesions of Windows 11 are released).

NOTE: There are currently two Long Term Servicing Channels that are supported by Microsoft for Windows 10.

Unsupported versions of Windows are added to the "Windows Version Not Compliant" group and flagged as "Non Compliant" while supported versions are added to the "supported windows" group and flagged as compliant.

## Needed for the policy

There are two XML files based on the version (Client vs. Server) that is being tracked.
