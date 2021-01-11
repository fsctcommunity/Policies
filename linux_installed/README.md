# Summary

# SecureConnector Managed

# Linux Server Agent Managed

With the introduction of the Linux Server Agent in 8.2.2 scripts that check for the status of "SecureConnector Managed" need to change to leverage the Linux Server Agent. We will leverage the "Linux Server Expected Script Result" condition instead of "SecureConenctor Managed." The scripts will be copied over to the local endpoint and run from the /tmp location unless otherwise specificed.

