# Specify vCenter Server, vCenter Server username and vCenter Server user password
$vCenter="XXX"  #vcenter address
$vCenterUser="XXXX" #username 
$vCenterPassword="XX" #password for username
$dc="XXX"   #datacenter
$cluster="XX" #cluster in datacenter
#

#
# Specify the template
$tempate = "qawin2012-vm"  # template
#


# Specify the datastore on accessible to ESXi
$ds = "XXX"

#ESXi  host
$Exhost="XX"

#
# Specify the VM name
$VM_prefix = "test-vm"
#
# End of user input parameters
#

write-host "Connecting to vCenter Server $vCenter" -foreground green
Connect-viserver $vCenter -user $vCenterUser -password $vCenterPassword -WarningAction 0
$i = 1 # number the  vm name should start (qa-vm33)
while ($i -le 10){
$VM_name= $VM_prefix + $i
$i=$i+1
$ESXi=Get-Cluster $cluster | Get-VMHost -state connected
write-host "Creation of VM $VM_name initiated" -foreground green
New-VM -Name $VM_Name -Template $tempate -VMHost $Exhost -Datastore $ds  -RunAsync
Start-Sleep -s 180
}
