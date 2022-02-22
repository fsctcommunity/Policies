# Network Changes

## Use Case

This is a collection of policies to help understand changes on the network:

- Consumer Router Detection
  
  - This policy looks for routers and switches that are on the network.
  
  - Additional consumer switch models will need to be added

- DHCP Servers and Relays

- Interesting Processes

  - This policy needs to be customized to meet your needs, but it is looking for specific processes running within an envionrment.

  - Since we are looking at processes we will need management of that device (Remote Inspection, or SecureConnector) Exmaples of "intereting processes" include:

    - Proxy/Browsing Control Bypass Controls

    - Security/Hacking Tools Running

    - Encryption Tools Running

    - No Interesting Processes Found.

- IP Port Change State

  - Specific interesting or important ports are tracked in a list for changes to them

  - This policy allows looks for devices that have ports being opened or closed and can be used for investigation or alerting

- IT Flows on Network

  - Based on SPAN or NETFLOW to see the flows on the network

  - The following flows are tracked:

    - SSH

    - Telnet

    - HTTP and HTTPS

    - Syslog

    - FTP

    - FTP

    - TFTP

    - Non IT Traffic

- New Device Detected
  
  - This policy tracks new devices on the network based on a time stamp in the main condition and works on Wireless, Wired, or Virtual.

- Operating System Changes Network

  - This policy tracks changes to device on the network with a focus on the Function classification.

- Track Device Move
  
  - This policy is focused on tracking devices moving between switches, and VLANs.

- Track Switch Change-state
  
  - This policy focuses on Switch Change state.

## Needed for the policy

Each use case listed above has it's own policy XML file, import the policies you need to use.
