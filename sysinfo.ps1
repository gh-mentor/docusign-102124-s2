# This PowerShell script will display operating system and computer system information.
# Requirements: PowerShell v5.1 or later.
# Steps:
# 1. Get operating system and computer system information.
# 2. Display the following system information:
# -  caption, version, name, and user name.

# Get operating system information
$os = Get-WmiObject -Class Win32_OperatingSystem

# Get computer system information
$computer = Get-WmiObject -Class Win32_ComputerSystem

# Display system information
Write-Host "Operating System Information:"
Write-Host "OS Caption: $($os.Caption)"
Write-Host "OS Version: $($os.Version)"
Write-Host "Computer Name: $($computer.Name)"
Write-Host "User Name: $($computer.UserName)"







