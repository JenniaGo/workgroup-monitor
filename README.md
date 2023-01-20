# workgroup-monitor
This project uses Ansible and Jenkins to install and configure Nagios on all the computers in a workgroup, to monitor the CPU and location status of the computers in the network.

This playbook uses the win_package and win_reg_stat modules to install and configure the Nagios agent on all the computers in the workgroup. The playbook assumes that the Nagios agent installation file is located in the files directory and that the ansible controller can access the computers via Remote PowerShell. The playbook also configures the agent to connect to the Nagios server, in this case, the server is "nagios.example.com".
