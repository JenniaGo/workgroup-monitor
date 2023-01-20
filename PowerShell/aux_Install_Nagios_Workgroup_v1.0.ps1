# Define the path to the Nagios agent installation file
$nagiosAgentPath = "\\server\share\nagios-agent.msi"

# Define the Nagios server
$nagiosServer = "nagios.example.com"

# Get a list of all the computers in the workgroup
$computers = Get-Content -Path "\\server\share\computers.txt"

# Loop through each computer and install the Nagios agent
foreach ($computer in $computers) {

    # Install the Nagios agent using the msiexec command
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $nagiosAgentPath /quiet", "-Wait" -ComputerName $computer

    # Configure the agent to connect to the Nagios server
    Invoke-Command -ComputerName $computer -ScriptBlock {
        Set-ItemProperty -Path "HKLM:\Software\Nagios" -Name "Server" -Value $nagiosServer
    }

    # Configure the agent to monitor CPU usage
    Invoke-Command -ComputerName $computer -ScriptBlock {
        Set-ItemProperty -Path "HKLM:\Software\Nagios" -Name "CheckCPU" -Value "1"
    }

    # Configure the agent to monitor location
    Invoke-Command -ComputerName $computer -ScriptBlock {
        Set-ItemProperty -Path "HKLM:\Software\Nagios" -Name "CheckLocation" -Value "1"
    }
}
