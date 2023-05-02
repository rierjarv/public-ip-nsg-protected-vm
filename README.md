# public-ip-nsg-protected-vm
A virtual machine with a public ip and a Network Security group (NSG) with a given set of allowed IPs for inbound traffic to protect the VM from unwanted access.

## Security considerations 

Variables are utilised such that they are populated from a local-only .tfvars file if running terraform from personal machine. Pipeline variables or similar can also be used.