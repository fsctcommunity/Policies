# Policies

NOTE: This is a collection of COMMUNITY maintained policies and not provied/supported by Forescout Technologies.

## Policy Information
Each policy folder will have a README.md file that will describe what the policy is actually doing and if there are any changes needed to your environment before using the policy in your enviornment.

## Listing of Policies
- SSL Certificate Check Policy
    - THis Policy is to locate all the machines listening on Port 443/TCP and then pulls back the certificate information to look for expiration
    - Various text infromation and other values can be grabbed from the certificate to be leveraged in a policy
- Remote Desktop NLA Detection Policy
    -Policy for detecting Managed Windows devices that that are listening on TCP/3389 (RDP) that have NLA enabled.
- Altiris Agent Hygiene
    - Policy to chcek status of the Altiris Services and whether or not they are working. Checks for the AEXNSAgent service running or not
- Windows Version Policy
    - Policy to grab the exact Windows 10 version by running a script to grab the full Windows version
<<<<<<< HEAD
- Cisco Security Group Tags
    - Policy set to determine if your machines are able to leverage Security Group Tags
=======
- Network Change Policies
    - Group of policies to track changes on the network
- Cisco SGT Readiness Check
    - Policy set to track readiness of devices to go to SGT
>>>>>>> 2bf37b0c537d3f042ff0099ae77048fad9c8195a
