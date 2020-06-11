# Get help here:
# https://github.com/solarwinds/OrionSDK/wiki/PowerShell

# If this is a new env to Orion SDK + PowerShell:
# 1) Get OrionSDK / SWQL Studio
# 2) Get the module installed: Install-Module -Name SwisPowerShell

# Install-Module -Name SwisPowerShell
# Import-Module SwisPowerShell


# Load SwisPowerShell
Import-Module SwisPowerShell

# connect to SWIS - use your connection details and credentials
$hostname = "localhost"
$username = "Username"
$password = "Password"
$swis = Connect-Swis -Username $username -Password $password

$AgentId = @(3)
$PluginId = "JobEngine"

foreach ($agent in $AgentId) {
    Invoke-SwisVerb $swis Orion.AgentManagement.Agent DeployPlugin @(
    $agent,` 
    $PluginId
    )
    Write-Host $PluginId "plugin installed on AgentId"$agent
}


