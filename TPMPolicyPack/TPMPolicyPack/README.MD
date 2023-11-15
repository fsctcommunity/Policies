# TPM Policies

## Use Case

This is a group of policies all built around tracking the TPM (Trusted Platform Module). Microsoft defines the TPM (<https://support.microsoft.com/en-us/topic/what-is-tpm-705f241d-025d-4470-80c5-4feeb24fa1ee>) as being used to improve the security of a PC. The TPM is built to make sure that operating system and firmware on a PC is what it is supposed to be and has not been tampared with. In Windows 11, one of the system requirements is to have TPM 2.0.

There are 3 policies in this TPM Policy Pack:

- Verify device is TPM Capable

- Verify TPM is enabled

- Specify the version of TPM

## Needed for the policy

In order to leverage these policies there are 3 things that are needed:

- TPM Policy Groups.xml - The groups leveraged by the policy, import them via the Group Manager

- TPM Policies -- The actual policies

- Scripts -- These are the scripts called by the policy.