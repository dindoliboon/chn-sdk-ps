function Invoke-IntelApiGetIntelFeed {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${hoursAgo},
        [Parameter(Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${limit},
        [Parameter(Position = 2, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${honeypot},
        [Parameter(Position = 3, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${protocol}
    )

    Process {
        'Calling method: IntelApi-GetIntelFeed' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($PSBoundParameters.ContainsKey('honeypot') -eq $false)
        {
            ${honeypot} = [NullString]::Value
        }
        if ($PSBoundParameters.ContainsKey('protocol') -eq $false)
        {
            ${protocol} = [NullString]::Value
        }

        $Script:IntelApi.GetIntelFeed(
            ${hoursAgo},
            ${limit},
            ${honeypot},
            ${protocol}
        ) | ConvertFrom-Json
    }
}

function Invoke-IntelApiGetIntelFeedCsv {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${hoursAgo},
        [Parameter(Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${limit},
        [Parameter(Position = 2, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${honeypot},
        [Parameter(Position = 3, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${protocol}
    )

    Process {
        'Calling method: IntelApi-GetIntelFeedCsv' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($PSBoundParameters.ContainsKey('honeypot') -eq $false)
        {
            ${honeypot} = [NullString]::Value
        }
        if ($PSBoundParameters.ContainsKey('protocol') -eq $false)
        {
            ${protocol} = [NullString]::Value
        }

        $Script:IntelApi.GetIntelFeedCsv(
            ${hoursAgo},
            ${limit},
            ${honeypot},
            ${protocol}
        )
    }
}

