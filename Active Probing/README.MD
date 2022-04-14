# Active Probing Plugin Policies

## Use Case

In version 8.4 of Forescout, an additional module was released as part of the core product focused on active inspection of devices. The goal is help support endpoint classification and the attributes returned will help the Device Classification Engine enhance classification. The Active Probing Plugin Configuration Guide covers the information needed for this module.

There is a policy template that is available to be used to create policies along with Custom Policies that can leverage attributes. These policies all come from the 

The following policies are all based off the Active Probing Module

- Active Probe - CPE

  - Describes the hardware of the endpoint, in Common Platform Enumeration (CPE) format.

- Active Probe - Firmware Version

  - The firmware release of the endpoint's hardware

- Active Probe - Model

  - The hardware model of the endpoint

- Active Probe - Operating System

  - The Operating System running on the endpoint

- Active Probe - OS Build

  - The build number of the operating system running on the endpoint

- Active Probe - OS CPE

  - Indicates the operating system running on the endpoint in Common Platform Enumeration (CPE)

- Active Probe - OS Version

  - The release number of the operating system running on the endpoint

- Active Probe - Function

  - Function of the endpoint

- Active Probe - Serial Number

  - The hardware serial number of the endpoint

- Active Probe - Vendor and Model

  - The hardware vendor and model of the endpoint

## Needed for the policy

The zip file of the various policies, and then the ones to be used can be imported in
