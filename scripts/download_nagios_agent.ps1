# Define the URL to download the Nagios agent installation file from
$nagiosAgentUrl = "https://assets.nagios.com/downloads/nagiosxi/agents/windows/nagios-agent-x64.msi"

# Define the path to the network share
$networkShare = "\\server\share"

# Download the Nagios agent installation file
Invoke-WebRequest -Uri $nagiosAgentUrl -OutFile "$networkShare\nagios-agent.msi"

