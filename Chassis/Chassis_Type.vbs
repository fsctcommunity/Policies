' VBScript to interogate a machine's chassis type.
' 
' ---------------------------------------------------------' 
Option Explicit
Dim strComputer, strChassis
Dim objWMIService, objChassis, colChassis, objItem
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" _
& strComputer & "\root\cimv2")
Set colChassis = objWMIService.ExecQuery _
("Select * from Win32_SystemEnclosure",,16)
For Each objChassis in colChassis
  For Each objItem in objChassis.ChassisTypes
    Select Case objItem
    Case 1 strChassis = "Maybe Virtual Machine"
    Case 2 strChassis = "??"
    Case 3 strChassis = "Desktop"
    Case 4 strChassis = "Thin Desktop"
    Case 5 strChassis = "Pizza Box"
    Case 6 strChassis = "Mini Tower"
    Case 7 strChassis = "Full Tower"
    Case 8 strChassis = "Portable"
    Case 9 strChassis = "Laptop"
    Case 10 strChassis = "Notebook"
    Case 11 strChassis = "Hand Held"
    Case 12 strChassis = "Docking Station"
    Case 13 strChassis = "All in One"
    Case 14 strChassis = "Sub Notebook"
    Case 15 strChassis = "Space-Saving"
    Case 16 strChassis = "Lunch Box"
    Case 17 strChassis = "Main System Chassis"
    Case 18 strChassis = "Lunch Box"
    Case 19 strChassis = "SubChassis"
    Case 20 strChassis = "Bus Expansion Chassis"
    Case 21 strChassis = "Peripheral Chassis"
    Case 22 strChassis = "Storage Chassis" 
    Case 23 strChassis = "Rack Mount Unit"
    Case 24 strChassis = "Sealed-Case PC" 

    End Select
  Next
Next
WScript.Echo "Computer chassis type: " & strChassis
'WScript.Echo strComputer & "'s chassis type: " & strChassis 
'Return = ws.run("c:\SYSPREP\i386\$oem$\sboot\...", 1, True)
WScript.Quit 

' End of WMI VBScript - Chassis type

