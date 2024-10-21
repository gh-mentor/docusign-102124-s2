# This PowerShell 5.1 script creates a type-safe network device abstraction.
# The example defines a class to act as an interface and concrete classes that implement the abstract class:
# - Define a class to act as an interface
# - Define concrete classes that implement the class
# - Create instances of the concrete classes
# - Use the instances

# Define a class 'NetworkDevice' to act as an interface
# Define methods 'Connect', 'Disconnect', and 'ShowStatus'
# - The methods must be overridden by the concrete classes
# - an exception is thrown if the methods are called directly
# - The class has properties 'Name', 'IpAddress', and 'Status'
# - The properties are initialized in the constructor

class NetworkDevice {
    [string]$Name
    [string]$IpAddress
    [string]$Status

    NetworkDevice ([string]$name, [string]$ipAddress) {
        $this.Name = $name
        $this.IpAddress = $ipAddress
        $this.Status = "Disconnected"
    }

    [void] Connect () {
        throw "Method 'Connect' must be overridden"
    }

    [void] Disconnect () {
        throw "Method 'Disconnect' must be overridden"
    }

    [void] ShowStatus () {
        throw "Method 'ShowStatus' must be overridden"
    }
}

# Define a concrete class 'NetworkDevice' that implements the abstract class
# Implement the abstract methods 'Connect', 'Disconnect', and 'ShowStatus'
# The class has an additional property 'NumberOfPorts' to store the number of ports
# Example usage:
# $router = [Router]::new("Router1", "localhost", 8)
# $router.Connect()
# $router.ShowStatus()
# $router.Disconnect()

class Router : NetworkDevice {
    [int]$NumberOfPorts

    Router ([string]$name, [string]$ipAddress, [int]$numberOfPorts) : base($name, $ipAddress) {
        $this.NumberOfPorts = $numberOfPorts
    }

    [void] Connect () {
        $this.Status = "Connected"
    }

    [void] Disconnect () {
        $this.Status = "Disconnected"
    }

    [void] ShowStatus () {
        Write-Output "Router $($this.Name) is $($this.Status)"
    }
}


# Create instance of the concrete class 'Router1', address "localhost:8080", number of ports 8
$router = [Router]::new("Router1", "localhost:8080", 8)

# Use the instance of the concrete class 'Router' then disconnect
$router.Connect()
$router.ShowStatus()

$router.Disconnect()
