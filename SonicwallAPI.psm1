# Importing public and private functions
#$PSScript = "C:\Program Files\WindowsPowerShell\Modules\SonicwallAPI\1.2.0.0"
$PublicFunc = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)
$PrivateFunc = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue)

# Dotsourcing files
ForEach ($import in @($PublicFunc + $PrivateFunc)) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Exporting just the Public functions
Export-ModuleMember -Function $PublicFunc.BaseName