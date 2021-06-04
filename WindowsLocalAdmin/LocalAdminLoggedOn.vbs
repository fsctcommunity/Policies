'==========================================================================
' NAME: LocalAdminLoggedOn.vbs
' DATE  : 05/10/2020
' COMMENT: Checks if accounts which are locally logged-on or connected via RDP
' 	have local admin rights explicitly or through group membership. 
'==========================================================================


On Error Resume Next
Redim arrAdmins(-1)

'Obtain computer name
Set objNetwork = CreateObject("Wscript.Network")
strComputer = objNetwork.ComputerName

'Setup LDAP Objects and get Domain info
Set objRoot = GetObject("LDAP://rootDSE")
Set objDomain = GetObject("LDAP://" & objRoot.Get("defaultNamingContext"))
'Get Default Domain Object Ex DC=Domain,DC=com
fqDomain = objRoot.Get("defaultNamingContext")

'Enumerate the members of the local admin group and store in an array
Set objLocalGroup = GetObject("WinNT://" & strComputer & "/Administrators,group")
EnumLocalGroup(objLocalGroup)

'Check for remote desktop sessions
Set objWMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" _ 
              & strComputer & "\root\cimv2") 
Set colSessions = objWMI.ExecQuery("Select * from Win32_LogonSession Where LogonType = 10") 
WScript.Echo "==RDP Sessions=="
If colSessions.Count = 0 Then 
   Wscript.Echo "No RDP users found" 
Else 
   For Each objSession in colSessions 
     Set colList = objWMI.ExecQuery("Associators of " _ 
         & "{Win32_LogonSession.LogonId=" & objSession.LogonId & "} " _ 
         & "Where AssocClass=Win32_LoggedOnUser Role=Dependent" ) 
     For Each objItem in colList 
		Wscript.echo objItem.Name & " is logged in via RDP and " & checkForAdmin(objItem.Name)
     Next 
   Next 
End If

'Check for local logon sessions
Wscript.Echo "==Local Log-On Sessions=="
Set colComputer = objWMI.ExecQuery("Select * from Win32_ComputerSystem")
For Each objComputer in colComputer
	If objComputer.Username <> "" Then ' There is a user logged on locally.
			If InStr(objComputer.Username,"\") Then
				tmpUser = Split(objComputer.Username,"\")
				UserName = tmpUser(UBound(tmpUser))
			Else
			    UserName = obj.Computer.Username
			End If
		Wscript.echo Username & " is logged in locally and " & checkForAdmin(Username)
	Else
		Wscript.echo "No locally logged-on users found"
	End If
Next	

'Troubleshooting used to print values of all accounts in the array
'Wscript.Echo "==Printing Array=="
'For i = (ubound(arrAdmins)) To 0 Step -1
'  Wscript.Echo arrAdmins(i)
'Next 

Sub EnumLocalGroup(ByVal objGroup)
    Dim objMember
    ' Enumerate direct members of group.
    For Each objMember In objGroup.Members
	'WScript.Echo objMember.Name
        If (LCase(objMember.Class) = "group") Then
            ' Nested group. Test if objMember is a local group.
            If (InStr(LCase(objMember.AdsPath), "/"& LCase(strComputer) & "/") > 0) Then
                EnumLocalGroup(objMember)
            ElseIf (InStr(LCase(objMember.AdsPath),"/nt authority/") > 0) Then
                ' Membership cannot be enumerated.
            Else
                ' objMember is a domain group.
                EnumDomainGroup(objMember.Name)
            End If
		Else 'Account is local and add directly to array
			redim preserve arrAdmins(UBound(arrAdmins)+1)
			arrAdmins(UBound(arrAdmins)) = lcase(objMember.Name)
        End If
    Next
End Sub

Sub EnumDomainGroup(DomainGroupName)
	'Wscript.echo DomainGroupName
	Set objDomainGroup = GetObject("LDAP://"&findGroupDN(DomainGroupName)&"")
	' Iterate through the user objects in the group
	For Each objUser In objDomainGroup.Members 'add all the account names to the array
		'WScript.Echo objUser.SamAccountName
		redim preserve arrAdmins(UBound(arrAdmins)+1)
		arrAdmins(UBound(arrAdmins)) = lcase(objUser.SamAccountName)
	Next
End Sub

'Function to obtain the Distinguished Name of the AD group
Function findGroupDN(groupAD) 
	Set objConnection = CreateObject("ADODB.Connection")
		objConnection.Open "Provider=ADsDSOObject;"
	Set objCommand = CreateObject("ADODB.Command")
		objCommand.ActiveConnection = objConnection
		objCommand.CommandText = "<LDAP://" & fqDomain & ">;(&(objectClass=" & "group" & ")" _
		& "(samAccountName=" & groupAD & "));samAccountName,distinguishedName;subtree"
	Set objRecordSet = objCommand.Execute
	If objRecordset.RecordCount = 0 Then
		WScript.echo "Unable to get Distinguished Name for " & groupAD
	Else
		findGroupDN = objRecordSet.Fields("distinguishedName").Value
	End If
	objConnection.Close
End Function

Function checkForAdmin(accountName)
	For i = (ubound(arrAdmins)) To 0 Step -1
		If arrAdmins(i) = Lcase(accountName) Then
			checkForAdmin = "is a local admin"
			Exit For
		Else
			checkForAdmin = "is not a local admin"
		End If
	Next
End Function

'If WScript.Arguments.Count > 0 Then
'	WScript.Echo WScript.Arguments.Item(0)
'	UserName = WScript.Arguments.Item(0)
'End if









