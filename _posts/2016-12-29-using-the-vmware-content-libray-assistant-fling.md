---
layout: post
title: "Using the VMware Content Libray Assistant Fling"
categories:
- VMware
comments: true
---
So VMware Flings have been on a roll recently. They have released what they call "VMware Content Library Assistant." This is a java based CLI app, that connects to your vCenter and searchers for your templates and then automatically creates and uploads them.

You can find the fling at the following URL.... 
[VMware Content Library Assistant](https://labs.vmware.com/flings/vsphere-content-library-assistant)

Once you download the fling, you can just run the following command.

```
java -jar sphere-content-library-assistant-1.0.jar -s servername -u username -p password
```

In my case my java home isn't setup on my mac so I had to run the following command to get it to work.

```
/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java -jar /pathtofolder/vsphere-content-library-assistant-1.0.jar -s servername -u username -p password
```

```
Davids-MacBook-Pro:~ davidstamen$ /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java -jar /Users/davidstamen/Downloads/vsphere-content-library-assistant-1.0.0/vsphere-content-library-assistant-1.0.jar -s vcsa6-01.lab.local -u administrator@vsphere.local -p Password

This app can assist you to on-board VC Templates to Content Library by doing the following:
1. Scan Datastores & Discover VC Templates (*.vmtx)
2. Recommend optimal inventorying intelligently
3. Create Content Libraries
4. Import VC Templates as OVF to Content Libraries

Connecting to Server vcsa6-01.lab.local
Credentials: Username:administrator@vsphere.local
Connected to: VMware VirtualCenter ServerSLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/Users/davidstamen/Downloads/vsphere-content-library-assistant-1.0.0/vsphere-content-library-assistant-1.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/Users/davidstamen/Downloads/vsphere-content-library-assistant-1.0.0/vsphere-content-library-assistant-1.0.jar!/lib/slf4j-log4j12-1.6.6.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]


Found the following VC templates to on-board

┌─────────────────────────────────────────────────┬────────────────────────────────────────────────┐
│ Datastore                                       │ VC Templates                                   │
├─────────────────────────────────────────────────┼────────────────────────────────────────────────┤
│ NFS01                                           │ [WIN2016, 2012R2, UBUNTU1604]                  │
└─────────────────────────────────────────────────┴────────────────────────────────────────────────┘



Recommending import flows

High Import Speed

┌────────────────────────┬────────────────────────┬────────────────────────┬───────────────────────┐
│ VC Template            │ Will be imported to    │ Created on this        │ Connected Hosts       │
│                        │ new ContentLibrary     │ Datastore              │                       │
├────────────────────────┼────────────────────────┼────────────────────────┼───────────────────────┤
│ [WIN2016, 2012R2,      │ NFS01_ContentLibrary_H │ NFS01                  │ [nuc2.lab.local,      │
│ UBUNTU1604]            │ S                      │                        │ nuc1.lab.local]       │
└────────────────────────┴────────────────────────┴────────────────────────┴───────────────────────┘





High Availability

┌────────────────────────┬────────────────────────┬────────────────────────┬───────────────────────┐
│ VC Template            │ Will be imported to    │ Created on this        │ Connected Hosts       │
│                        │ new ContentLibrary     │ Datastore              │                       │
├────────────────────────┼────────────────────────┼────────────────────────┼───────────────────────┤
│ [WIN2016, 2012R2,      │ NFS01_ContentLibrary_H │ NFS01                  │ [nuc2.lab.local,      │
│ UBUNTU1604]            │ A                      │                        │ nuc1.lab.local]       │
└────────────────────────┴────────────────────────┴────────────────────────┴───────────────────────┘




Press 1 for High Import Speed
Press 2 for High Availability

1

Creating ContentLibrary 'NFS01_ContentLibrary_HS' on 'NFS01'                                               	Success
	Importing 'WIN2016' to ContentLibrary 'NFS01_ContentLibrary_HS'                                    	Success
	Importing '2012R2' to ContentLibrary 'NFS01_ContentLibrary_HS'                                     	Success
	Importing 'UBUNTU1604' to ContentLibrary 'NFS01_ContentLibrary_HS'                                 	Success
```

Here is an example of what it looks like after the fling is run.

![](/images/contentlibraryassistantfling.png)
