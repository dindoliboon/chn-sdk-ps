function Invoke-FeedApiGetFeed {
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
        ${channel}
    )

    Process {
        'Calling method: FeedApi-GetFeed' | Write-Verbose
        $PSBoundParameters | Out-DebugParameter | Write-Debug

        if ($PSBoundParameters.ContainsKey('channel') -eq $false)
        {
            ${channel} = [NullString]::Value
        }

        $Script:FeedApi.GetFeed(
            ${hoursAgo},
            ${limit},
            ${channel}
        ) | ConvertFrom-Json
    }
}

