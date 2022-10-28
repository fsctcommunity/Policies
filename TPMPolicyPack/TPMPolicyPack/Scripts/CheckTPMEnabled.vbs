strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2\security\microsofttpm")
Set objStdOut = WScript.StdOut
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_Tpm",,48) 
For Each objItem in colItems 
		If objItem.IsEnabled_InitialValue = "False"  Then
			Wscript.Echo "false"
		ElseIf objItem.IsEnabled_InitialValue = "True" Then
			Wscript.Echo "true"
		End If
Next