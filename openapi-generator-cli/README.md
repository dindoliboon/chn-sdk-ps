# CHNv1.7 OpenAPI 3.0 for OpenAPI Generator
Describes CHNv1.7 API using OpenAPI 3.0 which can be used with OpenAPI Generator. JSON responses are not defined correctly.

## Requirements
- [Docker Desktop 2.0.0.3](https://www.docker.com/products/docker-desktop)
- [.NET Core SDK 2.2.103](https://dotnet.microsoft.com/download)
- [PowerShell Core 6.1.2](https://github.com/PowerShell/PowerShell)

## Build
```powershell
# Download and extract this repo to your computer, C:\api\chn-sdk-ps\

$apiRoot = 'C:\api\chn-sdk-ps'
$apiName = 'Chn.V1_7.Management'

Remove-Item -Path "$apiRoot\openapi-generator-cli\ps\" -Recurse

# Update openapi-generator-cli PowerShell template to allow nullable variables
docker run --rm --volume $apiRoot\openapi-generator-cli\update-openapi-generator-cli:/mnt/tmp openapitools/openapi-generator-cli sh -c "cp /opt/openapi-generator/modules/openapi-generator-cli/target/*.jar /mnt/tmp/bin"
docker run -it --rm --volume $apiRoot\openapi-generator-cli\update-openapi-generator-cli:/mnt/tmp crazymax/7zip sh -c "cd /mnt/tmp && 7z u bin/openapi-generator-cli.jar powershell"
docker run -it --rm --volume $apiRoot\openapi-generator-cli\update-openapi-generator-cli:/mnt/tmp crazymax/7zip sh -c "cd /mnt/tmp && 7z u bin/openapi-generator-cli.jar csharp"

# Generate PowerShell and C# clients
docker run --rm --volume $apiRoot\openapi-generator-cli:/local --volume $apiRoot\openapi-generator-cli\update-openapi-generator-cli\bin\openapi-generator-cli.jar:/opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar openapitools/openapi-generator-cli generate --generator-name powershell --input-spec /local/chn.yaml --output /local/ps --additional-properties packageName=$apiName
docker run --rm --volume $apiRoot\openapi-generator-cli:/local --volume $apiRoot\openapi-generator-cli\update-openapi-generator-cli\bin\openapi-generator-cli.jar:/opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar openapitools/openapi-generator-cli generate --generator-name csharp --input-spec /local/chn.yaml --output /local/ps/csharp/OpenAPIClient --additional-properties packageName=$apiName,packageVersion=0.0.1,targetFramework=v5.0,netCoreProjectFile=true

# Create Windows binary with dependencies
cd "$apiRoot\openapi-generator-cli\ps\csharp\OpenAPIClient"
dotnet publish --configuration=release --runtime win-x64

# Move default namespace files
Move-Item -Path "$apiRoot\openapi-generator-cli\ps\src\Org.OpenAPITools\*" -Destination "$apiRoot\openapi-generator-cli\ps\src\$apiName" -Force
Remove-Item -Path "$apiRoot\openapi-generator-cli\ps\src\Org.OpenAPITools" -Recurse

# Copy C# binaries for PowerShell
New-Item -Path "$apiRoot\openapi-generator-cli\ps\src\$apiName\Bin" -ItemType Directory -Force
Copy-Item -Path "$apiRoot\openapi-generator-cli\ps\csharp\OpenAPIClient\src\$apiName\bin\Release\netstandard1.3\win-x64\publish\*.dll" -Destination "$apiRoot\openapi-generator-cli\ps\src\$apiName\Bin\"

# Hide errors when using .NET Core
New-Item -Path "$apiRoot\openapi-generator-cli\ps\csharp\OpenAPIClient\bin" -ItemType Directory -Force
New-Item -Path "$apiRoot\openapi-generator-cli\ps\src\$apiName\Model" -ItemType Directory -Force
'@ECHO OFF' | Out-File -FilePath "$apiRoot\openapi-generator-cli\ps\csharp\OpenAPIClient\build.bat" -Encoding ascii

# Add fixes
Copy-Item -Path "$apiRoot\openapi-generator-cli\ps-fixes\*" -Destination "$apiRoot\openapi-generator-cli\ps\src\$apiName\" -Recurse -Force

# Build PowerShell module
cd "$apiRoot\openapi-generator-cli\ps"
.\Build.ps1
```

## Cmdlets
| Function                              | REST API                     | Description
|---------------------------------------|------------------------------|-------------
| Invoke-IntelApiGetIntelFeed           | GET /api/intel_feed          | Returns honeypot intel data from CHN Server
| Invoke-IntelApiGetIntelFeedCsv        | GET /api/intel_feed.csv      | Returns honeypot intel data from CHN Server as CSV
| Invoke-CredentialApiGetCredentials    | GET /api/credentials         | Returns a list of username / password combinations attempted against Cowrie honeypots
| Invoke-CredentialApiGetCredentialsCsv | GET /api/credentials.csv     | Returns a list of username / password combinations attempted against Cowrie honeypots as CSV
| Invoke-AttackerApiGetAttackerStatsIp  | GET /api/attacker_stats/{ip} | Returns detailed attacker statistics by IP address
| Invoke-AttackerApiGetTopAttackers     | GET /api/top_attackers       | Returns information regarding top attacking hosts
| Invoke-FeedApiGetFeed                 | GET /api/feed                | Returns full feed information for attacks.
| Invoke-SessionApiGetSession           | GET /api/session             | Returns full session information for attacks.

## Usage
```powershell
# Add module to current environment
$env:ChnApiUri = 'https://v1_7.chn.local'
$env:ChnApiKey = '__YOUR_CHN_TOKEN__'
Import-Module -Name 'C:\api\chn-sdk-ps\openapi-generator-cli\ps\src\Chn.V1_7.Management'

# Get honeypot intel
(Invoke-IntelApiGetIntelFeed -hoursAgo 10000).Data | Format-Table
Invoke-IntelApiGetIntelFeedCsv -hoursAgo 10000

# Get Cowrie attempted credentials
(Invoke-CredentialApiGetCredentials -hoursAgo 10000).Data | Format-Table
Invoke-CredentialApiGetCredentialsCsv -hoursAgo 10000

# Get detailed attacker stats
(Invoke-AttackerApiGetAttackerStatsIp -ip '127.0.0.1' -hoursAgo 10000).Data | Format-Table

# Get top attacker stats
(Invoke-AttackerApiGetTopAttackers -hoursAgo 10000).Data | Format-Table

# Get attack paylod information
(Invoke-FeedApiGetFeed -hoursAgo 10000).Data | Format-Table

# Get session information
(Invoke-SessionApiGetSession -hoursAgo 10000).Data | Format-Table
```

## To-Do
- Describe actual JSON responses instead of using ConvertFrom-Json.
