# IP parser for C:\ProgramData\SolarWinds\Collector\Logs\Plugins\Core.CpuMemory.Wmi.log
# Parses the log file for IPs that cannot be contacted.
# Outputs the results on the current users desktop. Comma separated.


$logfile_path = "C:\ProgramData\SolarWinds\Collector\Logs\Plugins\Core.CpuMemory.Wmi.log";
# $logfile_path = "C:\ProgramData\SolarWinds\Collector\Logs\Plugins\Core.CpuMemory.Snmp.log";
$regex = "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b";
$UserPath = "$home\Desktop\NodesWithIssues.txt"
$Error.Clear();
if ( $logfile_path -eq $null )
  {
  Write-Host "Message: Can't find ""logfile_path"" argument. Check documentation."
  exit 1
  }
if ( $regex -eq $null )
  {
  Write-Host "Message: Can't find ""regex"" argument. Check documentation."
  exit 1
  }
if ( !$(Test-Path $logfile_path) )
  {
  Write-Host "Message: File $logfile_path not found."
  exit 1
  }
$filename = split-path "$logfile_path" -leaf

 Get-Content $logfile_path | Where-Object {$_ -match $regex} | ForEach-Object {
      $str_match = [regex]::match($_,$regex).Value
      "$str_match," | Out-File -filepath $UserPath -Append
 }


