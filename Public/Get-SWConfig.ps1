function Get-SWConfig {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet('current','pending')]
        [string]
        $Type='current',
        # Parameter help description
        [Parameter()]
        [ValidateSet('json','text')]
        [string]
        $ReturnType = 'json'

    )
    begin {
        Test-SWConnection
        $Method = 'Get'
        $BaseResource = "config/$Type"
        if($ReturnType -eq 'json') {
            $Headers = @{
                Accept = 'application/json'
            }
        } 
        
        if($ReturnType -eq 'text') {
            $Headers = @{
                Accept = 'text/plain'
            }
        }
        $SWBaseUrl = $Script:SWConnection
    }

    process {
        # Query for DNS config
        $Resource = "$BaseResource"
        $Result = (Invoke-RestMethod -SkipCertificateCheck:$Script:IgnoreCert -Uri "$SWBaseUrl$Resource" -Method $Method -Headers $Headers)

        # Return the result
        $Result
    }
}