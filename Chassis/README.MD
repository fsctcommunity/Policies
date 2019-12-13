# Chassis Policy

This policy and VBScript runs to determine the type of Chassis a machine which can then be used in other policies or groups. The VBScript will be

## Use Case

An example would only running encryption compliance policies against laptops. Based on the results of the VBScript a group for Laptops is created and then my encryption compliance would be targeted to that specific group.

## Needed for the policy

The following items in this folder are needed for the policy

- Chassis_Type.vbs - The actual script needed

- Assessment - Windows - Chassis Type.xml - The Forescout Policy