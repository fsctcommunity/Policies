strComputer = "."
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colComputers = objWMIService.ExecQuery("Select DomainRole from Win32_ComputerSystem")
For Each objComputer in colComputers
    Select Case objComputer.DomainRole 
        Case 0 
            strComputerRole = "Standalone Workstation"
        Case 1        
            strComputerRole = "Member Workstation"
        Case 2
            strComputerRole = "Standalone Server"
        Case 3
            strComputerRole = "Member Server"
        Case 4
            strComputerRole = "Backup Domain Controller"
        Case 5
            strComputerRole = "Primary Domain Controller"
    End Select
    Wscript.Echo strComputerRole
Next