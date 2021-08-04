function Get-SWsnmp {
    <#
    .SYNOPSIS
    Retrieve snmp configuration from SonicWall appliance.

    .DESCRIPTION
    This function gets snmp configuration from a SonicWall appliance.

    .EXAMPLE
    Get-SWsnmp
    Gets the SonicWall appliance snmp configuration.
    #>
    [CmdletBinding()]
    param (

    )
    begin {
        # Testing if a connection to SonicWall exists
        #Test-SWConnection

        # Declaring used rest method
        $Method = 'get'

        # Declaring the base resource
        $BaseResource = 'snmp/settings'

        # Declaring the content type
        $ContentType = 'application/json'

        # Getting the base URL of our connection
        $SWBaseUrl = $Script:SWConnection
    }
    process {
        # Query for snmp config
        $Resource = $BaseResource
        $Result = (Invoke-RestMethod -SkipCertificateCheck:$Script:IgnoreCert -Uri "$SWBaseUrl$Resource" -Method $Method -ContentType $ContentType).snmp

        # Return the result
        $Result
    }
}