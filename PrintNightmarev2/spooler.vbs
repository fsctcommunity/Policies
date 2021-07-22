sComputer = "."
aTargetSvcs= Array("Spooler")

Set oWMIService = GetObject("winmgmts:" & "{impersonationlevel=impersonate}!\\" _
 & sComputer & "\root\cimv2")
Set cServices = oWMIService.ExecQuery("SELECT * FROM Win32_Service")

For Each oService In cServices
 For Each sTargetSvc In aTargetSvcs
  If LCase(oService.Name) = LCase(sTargetSvc) Then
   
   If oService.State <> "Stopped" Then
    oService.StopService()    
   End If

   If oService.StartMode <> "Disabled" Then    
    oService.ChangeStartMode("Disabled")
   End If  

  End If  
 Next
Next