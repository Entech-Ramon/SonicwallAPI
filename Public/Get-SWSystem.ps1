function Get-SWSystem {
    <#
    .SYNOPSIS
    Retrieve DNS configuration from SonicWall appliance.

    .DESCRIPTION
    This function gets DNS configuration from a SonicWall appliance.

    .EXAMPLE
    Get-SWDns
    Gets the SonicWall appliance DNS configuration.
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
        $BaseResource = 'reporting'

        # Declaring the content type
        $ContentType = 'application/json'

        # Getting the base URL of our connection
        $SWBaseUrl = $Script:SWConnection
    }
    process {
        # Query for DNS config
        $Resource = "$BaseResource/status/system"
        $Result = (Invoke-RestMethod -SkipCertificateCheck:$Script:IgnoreCert -Uri "$SWBaseUrl$Resource" -Method $Method -ContentType $ContentType)

        # Return the result
        $Result
    }
}