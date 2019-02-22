#region Import functions

'API', 'Model', 'Private' | Get-ChildItem -Path {
    Join-Path $PSScriptRoot $_
} -Filter '*.ps1' | ForEach-Object {
    Write-Verbose "Importing file: $($_.BaseName)"
    try {
        . $_.FullName
    } catch {
        Write-Verbose "Can't import function!"
    }
}

#endregion


#region Initialize APIs

$defaultBasePath = 'https://localhost'
if ($null -ne $env:ChnApiUri)
{
    $defaultBasePath = $env:ChnApiUri
}

'Creating object: Chn.V1_7.Management.Api.AttackerApi' | Write-Verbose
$Script:AttackerApi= New-Object -TypeName Chn.V1_7.Management.Api.AttackerApi -ArgumentList @($defaultBasePath)
$Script:AttackerApi.Configuration.AddApiKey('apikey', $env:ChnApiKey)

'Creating object: Chn.V1_7.Management.Api.CredentialApi' | Write-Verbose
$Script:CredentialApi= New-Object -TypeName Chn.V1_7.Management.Api.CredentialApi -ArgumentList @($defaultBasePath)
$Script:CredentialApi.Configuration.AddApiKey('apikey', $env:ChnApiKey)

'Creating object: Chn.V1_7.Management.Api.FeedApi' | Write-Verbose
$Script:FeedApi= New-Object -TypeName Chn.V1_7.Management.Api.FeedApi -ArgumentList @($defaultBasePath)
$Script:FeedApi.Configuration.AddApiKey('apikey', $env:ChnApiKey)

'Creating object: Chn.V1_7.Management.Api.IntelApi' | Write-Verbose
$Script:IntelApi= New-Object -TypeName Chn.V1_7.Management.Api.IntelApi -ArgumentList @($defaultBasePath)
$Script:IntelApi.Configuration.AddApiKey('apikey', $env:ChnApiKey)

'Creating object: Chn.V1_7.Management.Api.SessionApi' | Write-Verbose
$Script:SessionApi= New-Object -TypeName Chn.V1_7.Management.Api.SessionApi -ArgumentList @($defaultBasePath)
$Script:SessionApi.Configuration.AddApiKey('apikey', $env:ChnApiKey)


#endregion
