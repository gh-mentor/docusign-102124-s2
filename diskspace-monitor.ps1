#  This PowerShell 5.1 script monitors disk space on a remote computer

# Arguments:
# -computerName: The name of the computer to monitor disk space
# Output:
# The script will output the free and total disk space for each drive on the specified computer
# Detailed steps:
# - Get the computer name from the command line parameter
# -- If no computer name is provided, display usage information and exit
# - Get disk information for the specified computer
# - For each disk, calculate the free and total disk space in GB and output the information
# -- Round the values to 2 decimal places
# Example:
# .\diskspace-monitor.ps1 -computerName "remote-computer"

# Get the computer name from the command line parameter
param (
    [string]$computerName
)

# If no computer name is provided, display usage information and exit
if (-not $computerName) {
    Write-Host "Usage: .\diskspace-monitor.ps1 -computerName <computerName>"
    Exit
}

# Get disk information for the specified computer
$disks = Get-WmiObject Win32_LogicalDisk -ComputerName $computerName

# For each disk, calculate the free and total disk space in GB and output the information
foreach ($disk in $disks) {
    $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)
    $totalSpaceGB = [math]::Round($disk.Size / 1GB, 2)
    Write-Host "Drive $($disk.DeviceID): Free Space: $freeSpaceGB GB, Total Space: $totalSpaceGB GB"
}


