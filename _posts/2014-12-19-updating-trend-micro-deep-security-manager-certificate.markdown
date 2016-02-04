---
layout: post
title: Updating Trend Micro Deep Security Manager Certificate
categories:
- Trend Micro
comments: true
---
So going though v7, v8 and v9 of the certificate guides I continued to have some issues getting the certificate to work and the steps never included ways to add subject alternative names. Upon further research I have identified a good step by step to replace the trend micro DSM certificate and include subject alternative names using a Microsoft certificate authority.

1. Stop the “Trend Micro Deep Security Manager” service
2. If not already created, create a folder on the root of C:\ called “certs”
3. Go to C:\Program Files\Trend Micro\Deep Security Manager and create a new folder called “Backupkeystore”
4. Copy .keystore and configuration.properties to Backupkeystore folder
5. Open administrative command line & change directory to “C:\Program Files \Trend Mirco\Deep Security Manager\jre\bin\”
6. Run this command “keytool -genkey -alias tomcat -keyalg RSA -dname cn=(FQDN of Server)”.
This will create a “.keystore” file under the C:\Users\ directory
7. When prompted for password enter a password for the keystore.
8. Run this command “keytool -certreq -keyalg RSA -alias tomcat -file certrequest.txt”
9. When prompted for password use same password as entered in step 6.
10. Open the certrequest.txt located in C:\Program Files \Trend Micro\Deep Security Manager\jre\bin\ and copy the contents of the file.
11. Access the CA server site [https://certsrv](https://certsrv) and click “Request a certificate”.
12. Select “advanced certificate request”
13. Select “Submit a certificate request by using a base-64-encoded CMC or PKCS #10 file, or submit a renewal request by using a base-64-encoded PKCS #7 file”
14. Paste copied text from certrequest.txt in “Base-64-encoded certificate request” field, select “Web Server” under Certificate Template and enter Subject Alternative Names under Additional Attributes using the following format: “san:dns=&dns=” and click “Submit.”
15. Click “Download certificate chain” and save as “trend.p7b” in the certs folder on the C: drive
16. From administrative command prompt run this command “keytool -import -trustcacerts -alias tomcat -file C:\certs\trend.p7b -keystore C:\Users\\.keystore”
17. When prompted for password use same password as entered in step 6.
18. When prompted to “Install reply anyway”, type “yes”
19. Copy .keystore from C:\Users\%username%\ and paste it into C:\Program Files \Trend Micro\Deep Security Manager
20. From administrative command prompt change directories to C:\Program Files \Trend Micro\Deep Security Manager and run this command “.\configuration.properties”. This will open the configuration.properties in notepad.
21. Look for the line keystorePass= and delete the entry after the = symbol, enter the password used in step 6 after the = and save and close the file.
22. Restart the “Trend Micro Deep Security Manager” service
