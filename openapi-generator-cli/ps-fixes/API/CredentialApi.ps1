function Invoke-CredentialApiGetCredentials {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${hoursAgo},
        [Parameter(Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${limit}
    )

    Process {
        'Calling method: CredentialApi-GetCredentials' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug


        $Script:CredentialApi.GetCredentials(
            ${hoursAgo},
            ${limit}
        ) | ConvertFrom-Json
    }
}

function Invoke-CredentialApiGetCredentialsCsv {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${hoursAgo},
        [Parameter(Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${limit}
    )

    Process {
        'Calling method: CredentialApi-GetCredentialsCsv' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug


        $Script:CredentialApi.GetCredentialsCsv(
            ${hoursAgo},
            ${limit}
        )
    }
}

