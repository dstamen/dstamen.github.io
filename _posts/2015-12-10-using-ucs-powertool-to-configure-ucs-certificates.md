---
layout: post
title: "Using UCS PowerTool To Configure UCS Certificates"
categories:
- Cisco
comments: true
---
Im finally getting to dive back in to working with UCS. My latest task with my project of configuring 9 UCS Domains, was swapping out certificates. The first few I did via the GUI, and I thought can this be scripted? Well the answer is yes! See below for information on executing the script.

####***Pre-Requsites***
- [UCS Powertool](https://communities.cisco.com/docs/DOC-53838)

####***Link to Script***
- [AddUCSCert.ps1](https://github.com/dstamen/UCS-PowerTool/blob/master/AddUCSCert.ps1)

####***Preparing to Execute the Script***
The script is pretty straight forward, just need to define a few variables seen below and then you execute the script. I will walk you through the process.

{% highlight powershell %}
#Define Variables
$UCS = "FQDNofUCS" #Used to Connect to UCSM via PowerTool
$TrustPoint = "TP-Name" #Name of TrustPoint, AKA Root CA
$KeyRing = "KeyRingName" #name of KeyRing. Stores Certificate Information
$Modulus = "mod2048" #2048 bit key this can be 1024,2048,4096, etc
$CertDNS = "FQDNofUCS" #FQDN for Cert Request
$CertLocality = "City" #City for Cert Request
$CertState = "State" #State for Cert Request
$CertCountry = "US" #Country for Cert Request
$CertOrgName = "Org" #OrgName for Cert Request
$CertEmail = "me@lab.com" #Email for Cert Request
$CertSubjName = "FQDNofUCS" #FQDN for Cert Request
$CertIP = "FI-VIP-IP" #FI-VIP IP for Cert Request
$CertIpA = "FI-A-IP" #FI-A IP for Cert Request
$CertIpB = "FI-B-IP" #FI-B IP for Cert Request
$TPChain = "-----BEGIN CERTIFICATE-----
PASTE CERT CONTENT HERE FOR ROOTCA
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
PASTE CERT CONTENT HERE FOR SUB CA
-----END CERTIFICATE-----" #Delete Second part if not using a Root/Sub Scenario.
{%endhighlight%}

To gather information for the variables above you should have most the information handy. To get the TPChain(The Root/Sub Certs) you can follow these steps.

- If using a Microsoft CA navigate to http://caroot/certsrv. From here you can download the CA Certificate. Make sure to download it in the Base 64 format.
- If using a Microsoft Sub CA as well, navigate to http://casub/certsrv. From here you can download the CA Certificate. Make sure to download it in the Base 64 format.

![](/images/downloadcacert.png)

- If using a Non-Microsoft CA, contact your certificate provider for their root certificate and following the remaining steps.
- Open Certificate using a text editor and you should have it in a standard format, paste that info in the variable field. If not using a Sub, Delete the second part.

####***Executing the Script***
- Navigate to the directory using PowerShell and run .\AddUCSCert.ps1
- If you look inside UCSM you will see the script create the TrustPoint and KeyRing for the new certificate

![](/images/ucsmcert1.png)

- If you navigate to the KeyRing you will see the completed certificate Request.

![](/images/ucsmcert2.png)

- You will also see a popup, asking you for the completed certificate information. From here you will either submit it to your microsoft ca at htt://ca/certsrv and request an advanced web server certificate based on the CSR info in the keyring, or submit this to your 3rd party certificate provider.

![](/images/ucsmcert3.png)

- Once you paste the completed certificate in the script will finish executing, and will input the certificate information and set UCSM to use the new certificate. (You will be disconnected and have to reconnect.)
- You can verify the certificate information by logging back in and selecting the Certificate Details button on the keyring.

![](/images/ucsmcert4.png)

####***Hope this helps anyone else out wanted to automate certificate replacement on Cisco UCS.***
