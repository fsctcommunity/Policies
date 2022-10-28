'on error resume next
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set objStdOut = WScript.StdOut
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_PnPEntity WHERE Description LIKE 'Trusted%'",,48)

	For Each objItem in colItems
 		hwTPM = objItem.Description
    		wscript.echo hwTPM
Next