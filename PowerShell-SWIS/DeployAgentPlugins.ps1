
# Get help here:
# https://github.com/solarwinds/OrionSDK/wiki/PowerShell

# If this is a new env to Orion SDK + PowerShell:
# 1) Get OrionSDK / SWQL Studio
# 2) Get the module installed: Install-Module -Name SwisPowerShell


# Load SwisPowerShell
Import-Module SwisPowerShell

# connect to SWIS - use your connection details and credentials
$hostname = "localhost"
$username = "Weston"
$password = " "
$swis = Connect-Swis -Username $username -Password $password

$AgentIDs = @(1,2)
$PluginIDs = @("JobEngine","Core")

foreach ($agentId in $AgentIDs) {
    foreach ($PluginId in $PluginIDs) {
        Invoke-SwisVerb $swis Orion.AgentManagement.Agent DeployPlugin @(
            $agentId,`
            $PluginId
            )
        Write-Host $PluginId "plugin installed on AgentId"$agentId
    }
}


