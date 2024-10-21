<#
.SYNOPSIS
    Retrieves user information from Active Directory.

.DESCRIPTION
    This script retrieves user information from Active Directory based on the provided username.

.PARAMETER Username
    The username of the user to retrieve information for.

.EXAMPLE
    .\Get-UserInfo.ps1 -Username "jdoe"

.NOTES
    Author: Your Name
    Date: Today's Date
#>

param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Username
)

function Get-User {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Username
    )

    try {
        $user = Get-ADUser -Identity $Username -Properties DisplayName, EmailAddress
        if ($null -eq $user) {
            Write-Error "User not found: $Username"
        } else {
            return $user
        }
    } catch {
        Write-Error "An error occurred: $_"
    }
}

# Main script execution
$userInfo = Get-User -Username $Username
if ($userInfo) {
    Write-Output "User Display Name: $($userInfo.DisplayName)"
    Write-Output "User Email Address: $($userInfo.EmailAddress)"
}