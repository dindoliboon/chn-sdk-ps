function Invoke-SessionApiGetSession {
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
        ${protocol},
        [Parameter(Position = 4, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${sourceIp},
        [Parameter(Position = 5, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [String]
        ${destinationIp},
        [Parameter(Position = 6, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $false)]
        [System.Nullable[Int32]]
        ${destinationPort}
    )

    Process {
        'Calling method: SessionApi-GetSession' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($PSBoundParameters.ContainsKey('honeypot') -eq $false)
        {
            ${honeypot} = [NullString]::Value
        }
        if ($PSBoundParameters.ContainsKey('protocol') -eq $false)
        {
            ${protocol} = [NullString]::Value
        }
        if ($PSBoundParameters.ContainsKey('sourceIp') -eq $false)
        {
            ${sourceIp} = [NullString]::Value
        }
        if ($PSBoundParameters.ContainsKey('destinationIp') -eq $false)
        {
            ${destinationIp} = [NullString]::Value
        }

        $Script:SessionApi.GetSession(
            ${hoursAgo},
            ${limit},
            ${honeypot},
            ${protocol},
            ${sourceIp},
            ${destinationIp},
            ${destinationPort}
        ) | ConvertFrom-Json
    }
}

