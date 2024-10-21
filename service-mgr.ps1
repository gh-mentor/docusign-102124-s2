# This PowerShell 5.1 script is used to manage services on a remote computer.

# Steps:
# Prompt the user for a service name and computer name, then check if the service is running on the specified computer.
# If the service is not running, it will start the service.
# If the service is already running, it will display a message indicating that the service is already running.


# Prompt the user for the service name and computer name
$serviceName = Read-Host "Enter the service name"
$computerName = Read-Host "Enter the computer name"

# Check if the service is running
# Start the service if it is not running and display a message indicating the status
# If the service is not found on the computer or the computer is unreachable, display an error message
# If it is already running, display a message indicating that the service is already running
try {
    $service = Get-Service -Name $serviceName -ComputerName $computerName -ErrorAction Stop
    if ($service.Status -eq "Running") {
        Write-Host "The service $serviceName is already running on $computerName"
    } else {
        Start-Service -Name $serviceName -ComputerName $computerName
        Write-Host "The service $serviceName has been started on $computerName"
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)"
}
