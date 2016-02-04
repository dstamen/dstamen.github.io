---
layout: post
title: "Using Vagrant to Deploy a 2012R2 DHCP Failover Cluster"
categories:
- Vagrant
- Windows
comments: true
---
So I am in the process of rolling out a new 2012R2 DHCP Server Cluster, and I thought i would share my scripts with the community.

I have also rolled it into a Vagrant package so you can easily test it on your own, and execute the scripts by themselves against your environment to deploy.

[Here](https://github.com/dstamen/Vagrant/tree/master/windows-failoverdhcp) is a link to the **GitHub** repository containing all the code.

The code is also fairly simple, it pulls in data from a few .CSV files and deploy's the servers, installs the roles, creates the scopes, creates MAC Address allow policies and then creates a couple reservations.

#Files to modify to customize your installation
- ***dhcpservers.csv*** - IP's of your two DHCP servers
- ***createscopes.csv*** - Contains your Scope Name, StartRange, EndRange, Mask and Server to deploy to
- ***scopeoptions.csv*** - Contains your server specific options. You can add more columns and adjust the code to add alternate options
- ***scopeoptions.csv*** - Contains your scope specific options. You can add more columns and adjust the code to add alternate options
- ***scopefailover.csv*** - Used to create Failover Scopes, Specify the ScopeID, PartnerServer, LoadBalancePercent, MaxClientLeadTime, AutoStateTransition, StateSwitchInterval and Server to deploy against
- ***scopepolicy.csv*** - Used to create Scope Policies. In this example it creates a MAC Allow list, so only Mac Addresses listed will be allowed to pull leases.
- ***scopereservations.csv*** - Used to create Scope Reservations. Input your ScopeID, MAC Address and Reservation Name. It automatically pulls an available IP and reserves it.

Execute the Vagrant package by downloading it and running.
{% highlight bash %}
vagrant up
{% endhighlight %}

Execute the powershell script by downloading the scripts folder and running.
{% highlight powershell %}
.\install_ha_dhcp.ps1
{% endhighlight %}

#Here is a copy of the raw code.

{% highlight Powershell %}
# Powershell Script for Vagrant to install and configure DHCP
# @davidstamen
# http://davidstamen.com

cd c:\vagrant\scripts

$username = "vagrant"
$password = "vagrant"
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr

# Install the DHCP Role
Write-Host "Installing DHCP Server Role" -ForegroundColor "Red"
$csv = Import-CSV .\dhcpservers.csv
foreach ($server in $csv) {
  Install-WindowsFeature DHCP -IncludeAllSubFeature -IncludeManagementTools -Computer $server.IP -Credential $cred -Verbose
}

# Authorize the DHCP server in Active Directory
#Write-Host "Adding DHCP Server to AD" -ForegroundColor "Red"
#$csv = Import-CSV .\dhcpservers.csv
#foreach ($server in $csv) {
#Add-DhcpServerInDC -DnsName $server.Name -IPAddress $server.IP
#}

# Create an IPv4 DHCP scope
Write-Host "Adding DHCP Scopes" -ForegroundColor "Red"
$csv = Import-CSV .\createscopes.csv
foreach ($scope in $csv) {
    Add-DhcpServerv4Scope -ComputerName $scope.Server -Name $scope.Name -StartRange $scope.Start -EndRange $scope.End -SubnetMask $scope.mask -Verbose
}

# Set DHCP Server Options
Write-Host "Setting DHCP Server Options" -ForegroundColor "Red"
$csv = Import-CSV .\serveroptions.csv
foreach ($scope in $csv) {
  Set-DhcpServerv4OptionValue -ComputerName $scope.Server -DnsDomain $scope.DNSDomain -DNSServer $scope.DNSServer -Verbose
}

# Set DHCP Scope Options
Write-Host "Setting DHCP Scope Options" -ForegroundColor "Red"
$csv = Import-CSV .\scopeoptions.csv
foreach ($scope in $csv) {
  Set-DhcpServerv4OptionValue -ComputerName $scope.Server -ScopeId $scope.scopeID -Router $scope.Router -Verbose
  Set-DhcpServerv4Scope -ComputerName $scope.Server -ScopeId $scope.scopeID -LeaseDuration $scope.Lease -Verbose
}

# Configure Failover
Write-Host "Configuring DHCP Failover" -ForegroundColor "Red"
$csv = Import-CSV .\scopefailover.csv
foreach ($scope in $csv) {
  Add-DhcpServerv4Failover -ComputerName $scope.Server -Name $scope.scopeID -PartnerServer $scope.PartnerServer -ScopeId $scope.scopeID -LoadBalancePercent $scope.LoadBalancePercent -MaxClientLeadTime $scope.MaxClientLeadTime -AutoStateTransition ([System.Convert]::ToBoolean($scope.AutoStateTransition)) -StateSwitchInterval $scope.StateSwitchInterval -Verbose
}

#Create MAC Allow List DHCP policy
Write-Host "Creating MAC Allow List Policy" -ForegroundColor "Red"
$csv = Import-CSV .\scopepolicy.csv
foreach ($scope in $csv) {
  $maclist = @()
  $operator = $scope.Operator
  $maclist+=$operator
  $maclist+=$Scope.MAC1
  $maclist+=$Scope.MAC2
  Add-DhcpServerv4Policy -ComputerName $scope.Server -Name $scope.Name -Description $scope.Description -ScopeId $scope.ScopeID -Condition $scope.Condition -MacAddress $maclist -Verbose
  Add-DhcpServerv4PolicyIPRange -ComputerName $scope.Server -Name $scope.Name -ScopeId $scope.ScopeID -StartRange (Get-DHCPServerv4Scope $scope.ScopeID).StartRange -EndRange (Get-DHCPServerv4Scope $scope.ScopeID).EndRange -Verbose
}

#Reserve IP's
Write-Host "Reserving DHCP IPs" -ForegroundColor "Red"
$csv = Import-CSV .\scopereservations.csv
foreach ($scope in $csv) {
  Add-DhcpServerv4Reservation -ComputerName $scope.Server -ScopeId $scope.ScopeID -IPAddress (Get-DhcpServerv4FreeIPAddress -ComputerName $scope.Server -ScopeId $scope.ScopeID) -ClientId $Scope.MAC -Name $scope.Name -Verbose
}

#Replicate Settings
Write-Host "Forcing Replication" -ForegroundColor "Red"
Get-DhcpServerv4Failover -ComputerName $scope.Server|Invoke-DhcpServerv4FailoverReplication -ComputerName $scope.Server -Force
#Convert Leases to Reservation
#Get-DhcpServerv4Lease -ComputerName $server1 -ScopeID 10.10.10.0 | Add-DhcpServerv4Reservation -ComputerName $server1

{% endhighlight %}
