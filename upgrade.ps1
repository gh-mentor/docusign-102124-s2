# Get-OldUser.ps1
param (
    [string]$Username
)

$user = Get-WmiObject -Class Win32_UserAccount -Filter "Name='$Username'"
if ($null -eq $user) {
    Write-Host "User not found: $Username"
} else {
    Write-Host "User found: $($user.Name)"
}