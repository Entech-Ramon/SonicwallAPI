$Creds = [pscredential]$credObject = New-Object System.Management.Automation.PSCredential ("admin", (ConvertTo-SecureString "password" -AsPlainText -Force))
Remove-Module SonicwallAPI
Import-Module ./SonicwallAPI.psm1
Connect-SWAppliance -Server '10.0.0.189' -Credential $Creds -Port 443 -Insecure $false