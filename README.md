# vmcreate
#Createsvms on ESXi using Powershell.
#Script needs details about vCenter, Host, Cluster, User/password.
#It would login to vCenter over port 443 and copy the vm from a template.
#Simple while loop has been used to loop through and create multiple vms.
#There is a sleep added at the end to allow enough time for script to copy the vm.
#Or setup an ansible vm and forget about this :) 
