# Policies

NOTE: This is a collection of COMMUNITY maintained policies and not provided/supported by Forescout Technologies.

## Policy Information

Each policy folder will have a README.md file that will describe what the policy is actually doing and if there are any changes needed to your environment before using the policy in your environment.

## Listing of Policies

- Altiris
  - Policy to check status of the Altiris Services and whether or not they are working. Checks for the AEXNSAgent service running or not

- Chassis
  - Policy to determine the chassis of a Windows Machine
  - Leverages a VBScript to pull information in

- Cisco SGT Readiness Check
  - Policy set to track readiness of devices to go to SGT

- DSA-2021-088
  - Polcy to check for Dell firmware update driver vulnerabilities (CVE-2021-21551).

- Hacking Tools

- Hotspot Detection
  - Policy to check Windows Machines to see if a Hotspot is plugged in via USB

- Network Change Policies
  - Group of policies to track changes on the network

- Remote Desktop NLA Detection Policy
  - Policy for detecting Managed Windows devices that that are listening on TCP/3389 (RDP) that have NLA enabled.

- SSL Certificate Check Policy
  - This Policy is to locate all the machines listening on Port 443/TCP and then pulls back the certificate information to look for expiration

- Template Readme

- TPM 

- Windows Version 10 
  - Policy to grab the exact Windows 10 version by running a script to grab the full Windows version