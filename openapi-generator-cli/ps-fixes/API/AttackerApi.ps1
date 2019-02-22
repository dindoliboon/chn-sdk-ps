function Invoke-AttackerApiGetAttackerStatsIp {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [String]
        ${ip},
        [Parameter(Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${hoursAgo}
    )

    Process {
        'Calling method: AttackerApi-GetAttackerStatsIp' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($PSBoundParameters.ContainsKey('ip') -eq $false)
        {
            ${ip} = [NullString]::Value
        }

        $Script:AttackerApi.GetAttackerStatsIp(
            ${ip},
            ${hoursAgo}
        ) | ConvertFrom-Json
    }
}

function Invoke-AttackerApiGetTopAttackers {
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
        ${sourceIp}
    )

    Process {
        'Calling method: AttackerApi-GetTopAttackers' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($PSBoundParameters.ContainsKey('honeypot') -eq $false)
        {
            ${honeypot} = [NullString]::Value
        }
        if ($PSBoundParameters.ContainsKey('sourceIp') -eq $false)
        {
            ${sourceIp} = [NullString]::Value
        }

        $Script:AttackerApi.GetTopAttackers(
            ${hoursAgo},
            ${limit},
            ${honeypot},
            ${sourceIp}
        ) | ConvertFrom-Json
    }
}

