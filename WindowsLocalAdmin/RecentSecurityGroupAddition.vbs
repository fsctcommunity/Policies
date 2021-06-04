'==========================================================================
' NAME: RecentSecurityGroupAddition.vbs
' DATE  : 06/19/2014
' COMMENT: Searches Event Logs on Windows system for Additions to local security groups
'==========================================================================
On Error Resume Next

'Sets date for security log checks to 1 month prior to present
y = year(DateAdd("m",-1,date))
m = month(DateAdd("m",-1,date))
d = day(DateAdd("m",-1,date))
'Adds 0 for months under 10 for formatting
If m <= 9 AND m > 0 Then
	m = "0" & m
End If
'Adds 0 for days under 10 for formatting
If d <=9 Then
	d = "0" & d
End If
sDate = y & m & d & "000000.000000-240"

'Create WMI Connection
Set objWMI = GetObject("winmgmts:{impersonationLevel=impersonate,(Security)}!\\.\root\cimv2")

'Determine Operating System
Set colOperatingSystems = objWMI.ExecQuery("Select * from Win32_OperatingSystem")
For Each objOperatingSystem in colOperatingSystems
	OSvers = objOperatingSystem.Version
	OSCaption = objOperatingSystem.Caption
Next

If InStr(OSvers,"5.1.") > 0 Then
	'Windows XP
	Wscript.Echo OSCaption & ", Version: " & OSVers
	strCode = "636"
ElseIf InStr(OSvers,"6.1.") > 0 Then
	'Windows 7
	strCode = "4732"
	Wscript.Echo OSCaption & ", Version: " & OSVers 
ElseIf InStr(OSvers,"6.2.") > 0 Then
	'Windows 8
	strCode = "4732"
	Wscript.Echo OSCaption & ", Version: " & OSVers
ElseIf InStr(OSvers,"6.3.") > 0 Then
	'Windows 8.1
	strCode = "4732"
	Wscript.Echo OSCaption & ", Version: " & OSVers 
ElseIf InStr(OSvers,"10.") > 0 Then
	'Windows 10
	strCode = "4732"
	Wscript.Echo OSCaption & ", Version: " & OSVers 	
Else
	Wscript.Echo "OS version" & OSvers &" not indentifiable, assuming standard event code 4732"
	strCode = "4732"
End If

'Call the sub to check event logs
If strCode = "636" Then
	GetEventXP strCode
Else
	GetEvent7up strCode
End If

'Cleanup and close
Set objWMI = NOTHING
Wscript.quit 0

Sub GetEventXP(code)
	On error resume next
	found = FALSE
	strLogType = "'security'"
	Set colLoggedEvents = objWMI.ExecQuery _
	("Select * from Win32_NTLogEvent Where Logfile =" & strLogType & " AND EventCode=" & code & " AND TimeGenerated>='" & sDate & "' AND User !='NT Authority\\System'")
	For Each objItem in colLoggedEvents
			wscript.echo objItem.Message
			wscript.echo objItem.User & " gave admin rights on " & wmiDateStringToDate(objItem.TimeGenerated)
			found = TRUE
	Next
	IF found = FALSE Then
		Wscript.Echo "No recent additions to the local administrators group"
	End If
End Sub	

Sub GetEvent7up(code)
	On Error Resume Next
	found = FALSE
	strLogType = "'security'"
	Set colLoggedEvents = objWMI.ExecQuery _
	("Select * from Win32_NTLogEvent Where Logfile =" & strLogType & " AND EventCode=" & code &" AND TimeGenerated>='" & sDate & "' AND User !='NT Authority\\System'")
	For Each objItem in colLoggedEvents
		found = TRUE
		'Parse Group Name from event message
		leftStrGroup = InStr(objItem.Message,"Group:")
		midStrGroup = InStr(leftStrGroup,objitem.message,"Group Name:") + 12
		endStrGroup = InStr(midStrGroup,objitem.message,"Group Domain:") -3
		strGroup = mid(objitem.message,midStrGroup,endStrGroup-midStrGroup)
		If InStr(LCASE(strGroup),"administrators") > 0 Then
			'Parses SID of account assigned rights
			leftStrAdmin = InStr(objItem.Message,"Member:")
			midStrAdmin = InStr(leftStrAdmin,objitem.message,"S-")
			endStrAdmin = InStr(midStrAdmin,objitem.message,"Account") -3
			sidStrAdmin = mid(objitem.message,midStrAdmin,endStrAdmin-midStrAdmin)
			'Parses the assigning user
			leftStrAssigner = InStr(objItem.Message,"Subject:")
			midStrAssigner = InStr(leftStrAssigner,objitem.message,"Account Name:") + 15
			endStrAssigner = InStr(midStrAssigner,objitem.message,"Account Domain:") -3
			StrAssigner = mid(objitem.message,midStrAssigner,endStrAssigner-midStrAssigner)
			'wscript.echo objItem.Message
			sidUser = getUserFromSid(sidStrAdmin)
			Wscript.echo StrAssigner & " gave admin rights to " & sidUser & " on " & wmiDateStringToDate(objItem.TimeGenerated)
		End If
	Next
	If found = FALSE Then
		Wscript.Echo "No recent additions to the local administrators group"
	End If
End Sub

Function getUserFromSid(theSID)
	'on error resume next
	Set objAccount = objWMI.Get("Win32_SID.SID='" & theSID & "'")
	userName = objAccount.AccountName
	If userName = "" Then 
		userName = "Uknown"
	End If
	getUserfromSid = userName
End Function

Function wmiDateStringToDate(dtmDate)
    wmiDateStringToDate = CDate(Mid(dtmDate, 5, 2) & "/" & Mid(dtmDate, 7, 2) & "/" & Left(dtmDate, 4) & " " & Mid (dtmDate, 9, 2) & ":" & Mid(dtmDate, 11, 2) & ":" & Mid(dtmDate, 13, 2))
End Function