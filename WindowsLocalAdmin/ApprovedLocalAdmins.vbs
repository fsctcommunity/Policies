'==========================================================================
' NAME: ApprovedLocalAdmins.vbs
' DATE  : 06/19/2014
' COMMENT: Searches for approved local admin users and groups.
'==========================================================================
On Error Resume Next
Dim objLocalGroup

If WScript.Arguments.Count > 0 Then
	'Take command line arguments and pipe into admin list. Arguments should be comma separated and spaces as '#'.
	'Example: ApprovedLocalAdmins.vbs domain#admins,administrator,pctechs
	strAdminList = Replace(Wscript.Arguments(0), "#", " ")
Else
	'*USAGE* Add each approved local admin account here separated by a comma.
	'This list is used if no arguments are supplied.
	'Example: strAdminList = "Domain Admins,PCTechs,NOC-Support"
	strAdminList = "Domain Admins,administrator"
End If

arrApprovedAdmins = split(strAdminList,",")

'Bind to local Administrators group.
Set objLocalGroup = GetObject("WinNT://./Administrators,group")
'Enumerate members of the local group.
Call EnumLocalGroup(objLocalGroup)

'Cleanup
Set objLocalGroup = nothing
Wscript.quit

Sub EnumLocalGroup(ByVal objGroup)
    Dim objMember, bCompliant
    'Enumerate direct members of group.
    For Each objMember In objGroup.Members
		bCompliant = FALSE
		strAccount = Lcase(objMember.Name)
		For i = 0 to uBound(arrApprovedAdmins)
			If Lcase(Trim(arrApprovedAdmins(i))) = strAccount Then
				'WScript.Echo "MATCH: " & strAccount
				bCompliant = TRUE
			Else
				'Wscript.Echo "NO MATCH: " & strAccount
			End If
		Next
		If bCompliant = FALSE Then
			Wscript.Echo "NonCompliant: " & strAccount
		Else
			Wscript.Echo "Compliant: " & strAccount
		End If
    Next
End Sub

