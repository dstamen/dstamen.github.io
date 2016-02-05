---
layout: post
title: "VCAP6-Design Beta Study Guide"
categories:
- Certification
comments: true
---
It is now VCAP6-Design study time! Here is my blueprint laid out, and hopefully will be populated with some content.

###Section 1 – Create a vSphere Conceptual Design

#### Objective 1.1 – Gather and analyze business requirements

***Skills and Abilities***

- Associate a stakeholder with the information that needs to be collected.
- Utilize inventory and assessment data from a current environment to define a baseline state.
- Analyze customer interview data to explicitly define customer #### Objectives for a conceptual design.
- Determine customer priorities for defined #### Objectives.
- Ensure that Availability, Manageability, Performance, Recoverability and Security (AMPRS) considerations are applied during the requirements gathering process.
- Given results of the requirements gathering process, identify requirements for a conceptual design.
- Categorize requirements by infrastructure qualities to prepare for logical design requirements.

***Tools***

- VMware Virtualization Case Studies
- The Benefits of Virtualization for Small and Medium Businesses
- Functional vs. Non-Functional Requirements
- Conceptual, Logical, Physical: It is Simple
- Virtualize Business Critical Applications (blog)
- Virtualizing Business Critical Applications on vSphere

#### Objective 1.2 – Gather and analyze application requirements

***Skills and Abilities***

- Gather and analyze application requirements for a given scenario.
- Determine the requirements for a set of applications that will be included in the design.
- Collect information needed in order to identify application dependencies.
- Given one or more application requirements, determine the impact of the requirements on the design.

***Tools***

- VMware TCO Calculator
- VMware Cost-Per-Application Calculator Methodology
- Virtualizing Oracle with VMware
- Virtualizing Exchange with VMware
- Virtualize SharePoint with VMware vSphere
- Virtualizing Microsoft SQL on VMware vSphere
- SAP and VMware Virtualization
- Business and Financial Benefits of Virtualization: Customer Benchmarking Study

#### Objective 1.3 – Determine Risks, Requirements, Constraints and Assumptions

***Skills and Abilities***

- Differentiate between the concepts of risks, requirements, constraints, and assumptions.
- Given a statement, determine whether it is a risk, requirement, constraint, or an assumption.
- Analyze impact of VMware best practices to identified risks, constraints, and assumptions.

***Tools***

- Developing Your Virtualization Strategy and Deployment Plan
- Constraints, Assumptions (Risk, Requirements) & Dependencies

### Section 2 – Create a vSphere 6.x Logical Design from an Existing Conceptual Design

#### Objective 2.1 – Map Business Requirements to a vSphere 6.x Logical Design

***Skills and Abilities***

- Analyze requirements for functional and non-functional elements.
- Build non-functional requirements into a specific logical design.
- Translate stated business requirements into a logical design.
- Incorporate the current state of a customer environment into a logical design.

***Tools***

- Conceptual, Logical, Physical: It is Simple
- What’s New in VMware vSphere 6.0
- Functional vs. Non-Functional Requirements
- ITIL v3 Introduction and Overview
- Conceptual Architecture Action Guide
- Systems Architecture Fundamentals – Conceptual, Logical, Physical Designs

#### Objective 2.2 – Map Service Dependencies

***Skills and Abilities***

- Evaluate dependencies for infrastructure and application services that will be included in a vSphere design.
- Create Entity Relationship Diagrams that map service relationships and dependencies.
- Analyze interfaces to be used with new and existing business processes.
- Determine service dependencies for logical components.
- Include service dependencies in a vSphere 6.x Logical Design.
- Analyze services to identify upstream and downstream service dependencies.
- Navigate logical components and their interdependencies and make decisions based upon all service relationships.

***Tools***

- Datacenter Operational Excellence Through Automated Application Discovery & Dependency Mapping
- VMware Application Dependencies and Entity Relationship Diagrams MK2

#### Objective 2.3 – Build Availability Requirements into a vSphere 6.x Logical Design

***Skills and Abilities***

- Evaluate which logical availability services can be used with a given vSphere solution.
- Differentiate infrastructure qualities related to availability.
- Describe the concept of redundancy and the risks associated with single points of failure
- Explain class of nines methodology
- Determine availability component of service level agreements (SLAs) and service level management processes
- Determine potential availability solutions for a logical design based on customer requirements.
- Create an availability plan, including maintenance processes.
- Balance availability requirements with other infrastructure qualities.
- Analyze a vSphere design and determine possible single points of failure.

***Tools***

- Datacenter Operational Excellence Through Automated Application Discovery & Dependency Mapping
- vSphere Availability Guide
- Protect Your Business with Automated Business Continuity Solutions
- VMware High Availability Deployment Best Practices

#### Objective 2.4 – Build Manageability Requirements into a vSphere 6.x Logical Design

***Skills and Abilities***

- Evaluate which management services can be used with a given vSphere Solution.
- Differentiate infrastructure qualities related to management.
- Differentiate available command line-based management tools (PowerCLI, vMA etc.)
- Evaluate VMware Management solutions based on customer requirements.
- Build interfaces into the logical design for existing operations practices.
- Address identified operational readiness deficiencies
- Define Event, Incident and Problem Management practices.
- Analyze Release Management practices
- Determine request fulfillment and release management processes.
- Determine requirements for Configuration Management
- Define change management processes based on business requirements.
- Based on customer requirements, identify required reporting assets and processes

***Tools***

- Optimizing Your VMware Environment
- Four Keys to Managing Your VMware Environment
- Operational Readiness Assessment
- Operational Readiness Assessment Tool
- vCenter Server and Host Management Guide
- vSphere PowerCLI documentation Center

#### Objective 2.5 – Build Performance Requirements into a vSphere 6.x Logical Design

***Skills and Abilities***

- Evaluate logical performance considerations for a given vSphere solution.
- Differentiate infrastructure qualities related to performance.
- Analyze current performance, identify and address gaps when building the logical design
- Using a conceptual design, create a logical design that meets performance requirements
- Determine performance-related functional requirements based on given non-functional requirements and service dependencies.
- Define capacity management practices and create a capacity plan
- Incorporate scalability requirements into the logical design
- Determine a performance component for service level agreements and service level management processes.

***Tools***

- Proven Practice: Implementing ITIL v3 Capacity Management in a VMware environment
- vSphere Monitoring and Performance Guide

#### Objective 2.6 – Build Recoverability Requirements into a vSphere 6.x Logical Design

***Skills and Abilities***

- Evaluate which logical recoverability services are available for a given vSphere solution.
- Differentiate infrastructure qualities related to recoverability.
- Determine Business Continuity and Disaster Recovery solution options for a given vSphere Design.
- Given recoverability requirements, analyze services that will be impacted and provide a recovery plan for impacted services.
- Plan a data retention policy based on customer requirements.

***Tools***

- VMware vCenter™ Site Recovery Manager Evaluation Guide
- A Practical Guide to Business Continuity and Disaster Recovery with VMware Infrastructure
- Mastering Disaster Recovery: Business Continuity and Virtualization Best Practices Whitepaper

#### Objective 2.7 – Build Security Requirements into a vSphere 6.x Logical Design

***Skills and Abilities***

- Evaluate which security services can be used with a given vSphere solution.
- Differentiate infrastructure qualities related to security.
- Build specific regulatory compliance requirements into the logical design.
- Analyze application and infrastructure security requirements.
- Build a role-based access model and map roles to services.
- Build a security policy based on existing security requirements and IT governance practices.
- Incorporate customer risk tolerance into the security policy.
- Assess the services that will be impacted and create an access management plan.
- Determine the proper security solution that would satisfy a regulatory requirement.
- Based on stated security requirements, analyze the current state for compliance/non-compliance.

***Tools***

- vSphere Security Guide
- Developing Your Virtualization Strategy and Deployment Plan
- Achieving Compliance in a Virtualized Environment
- Infrastructure Security: Getting to the Bottom of Compliance in the Cloud
- Securing the Cloud

### Section 3 – Create a vSphere 6.x Physical Design from an Existing Logical Design

#### Objective 3.1 – Transition from a Logical Design to a vSphere 6.x Physical Design

***Skills and Abilities***

- Analyze design decisions and options selected from the logical design
- Determine impact of VMware best practices to identified risks, constraints, and assumptions in a given vSphere design.
- Based on business requirements, determine the appropriate roles for each staff member.

***Tools***

- Conceptual, Logical, Physical: It is Simple
- vSphere Server and Host Management Guide
- vSphere Virtual Machine Administration Guide

#### Objective 3.2 – Create a vSphere 6.x Physical Network Design from an Existing Logical Design

***Skills and Abilities***

- Analyze VLAN options with respect to virtual and physical switches.
- Given business requirements, determine the design for virtual network components:
  - STP
  - Jumbo Frames
  - Load-balancing
  - Trunking and link aggregation groups
- Evaluate network redundancy considerations for a given design.
- Analyze design for inclusion of Network I/O Control capabilities.
- Determine use case for multiple TCP/IP stacks in a given design.
- Based on given functional requirements for each service:
  - Determine the most appropriate networking technologies for the design.
  - Implement the service based on the required infrastructure qualities (AMPRS.)
- Analyze design for appropriate network teaming and failover solution.
- Determine network security and firewall requirements for a virtual network design
- Based on service level requirements, determine appropriate network performance characteristics.
- Given a current network configuration as well as technical requirements and constraints, determine the appropriate virtual switch solution:
  - vSphere Standard Switch
  - vSphere Distributed Switch
  - NSX
  - Hybrid solutions
- Based on an existing logical design, determine appropriate host networking resources.
- Properly apply converged networking considering VMware best practices.

***Tools***

- vSphere Server and Host Management Guide
- vSphere Installation and Setup Guide - vSphere Networking Guide - Network Port Diagram for vSphere 6.x
- VMware Virtual SAN Network Design Guide
- Leveraging NIC Technology to Improve Network Performance in VMware vSphere
- Performance Evaluation of Network I/O Control in VMware vSphere 6
- vMotion Architecture, Performance and Best Practices in VMware vSphere 5

#### Objective 3.3 – Create a vSphere 6.x Physical Storage Design from an Existing Logical Design

***Skills and Abilities***

- Evaluate criteria, capabilities and limitations between storage types (Block, NAS, Object Based)
- In a given design, determine Storage Policy availability and performance characteristics.
- Based on the logical design and given functional requirements, for each service:
  - Determine the most appropriate storage technologies for the design.
  - Implement the service based on the required infrastructure qualities.
- Ensure storage array capabilities are supported in a vSphere 6.x design:
  - Active/Active, Active/Passive
  - ALUA, VAAI, VASA
  - PSA (including PSPs and SATPs)
- Based on service level requirements include VMware technologies in the design, such as:
  - Storage I/O Control and Network I/O Control
  - Storage Policies
  - Storage vMotion
  - Storage DRS
  - Virtual SAN
- Given the functional requirements, size the storage for capacity, availability and performance, including:
  - Datastores, RDMs, Virtual Disks
  - Physical Storage (LUNs, Storage Tiering)
  - Based on the logical design, select and incorporate an appropriate storage network into the physical design:
  - Block (FC, iSCSI, FCoE, SAS)
  - NAS (NFSv3, NFSv4)
  - Object Based (Virtual SAN, Virtual Volumes)

***Tools***

- What’s New: VMware Virtual SAN 6.0
- VMware Virtual SAN 6.0 Design and Sizing Guide
- VMware Virtual SAN Diagnostics and Troubleshooting Reference Manual
- The VMware Perspective on Software-Defined Storage
- vSphere Storage
- Resource Management Guide
- Virtual SAN TCO and Sizing Calculator
- What’s New: VMware vSphere Virtual Volumes
- vSphere Installation and Setup Guide
- VMware Virtual Machine File System: Technical Overview and Best Practices
- TechNote: Bootstrapping VSAN without vCenter

#### Objective 3.4 – Determine Appropriate Compute Resources for a vSphere 6.x Physical Design

***Skills and Abilities***

- Analyze best practices with respect to CPU family choices.
- Evaluate NUMA and vNUMA with ESXi hosts and Virtual machines in a given design.
- Analyze the following in a vSphere design:
  - Enhanced vMotion compatibility
  - Implications of vSMP in virtual machines
  - Transparent Page Sharing (TPS) and large pages
  - Resource overcommitment
- Based on the service catalog and given functional requirements:
  - Determine the most appropriate compute technologies for the design.
  - Implement the service based on the required infrastructure qualities.
- Determine the impact of a technical design on the choice of server density:
  - Scale Up/Out
  - Auto Deploy
- Calculate the required number of nodes in an HA cluster based upon host failures and resource guarantees.
- Evaluate the implications of using reservations, limits, and shares on the physical design.
- Specify the resource pool and vApp configuration based upon resource requirements.
- Size the following resources appropriately:
  - Memory
  - CPU
  - I/O devices
  - Internal storage
- Given a constraint to use existing hardware, determine suitability of the hardware for the design.

***Tools***

- vSphere Server and Host Management Guide
- What’s New in the VMware vSphere® 6.0 Platform
- vSphere Installation and Setup Guide
- vSphere Resource Management Guide
- Performance Best Practices for VMware vSphere 6.0
- VMware vCenter Server Performance and Best Practices
- Best Practices for Performance Tuning of Latency-Sensitive Workloads in vSphere VMs
- Performance Characterization of Microsoft SQL Server on VMware vSphere 6
- Microsoft Exchange 2013 on VMware Best Practices Guide - vSphere Monitoring and Performance Guide
- Interpreting esxtop statistics

#### Objective 3.5 – Determine Virtual Machine Configuration for a vSphere 6.x Physical Design

***Skills and Abilities***

- Analyze the use of an RDM or a virtual disk for a given VM.
- Evaluate Virtual Machine memory management techniques (ballooning, compression, swapping) in a given vSphere design.
- Based on business requirements, determine the design significance of VM Swap location.
- Determine the latency sensitivity requirements of a given virtual machine workload.
- Evaluate virtual machine features based on the logical, functional and application requirements.
- Use VMware best practices to size virtual machines according to application requirements.
- Determine if reservations, shares, and limits are necessary.
- Based on an existing logical design, determine virtual hardware options.
- Build a Content Library of appropriate virtual machine offerings (e.g. templates, OVFs, ISOs.)
- Determine appropriate use cases for vApps.
- Evaluate the suitability of using VMware FT or 3rd party clustering products (e.g. Microsoft Clustering, etc.) based on application requirements.
- Determine the impact of scheduled guest activities (e.g. anti-virus, backup, etc) to the design.
- Evaluate vFlash read cache requirements in a given design.

***Tools***

- Virtual Machine Administration Guide
- Best Practices for Performance Tuning of Latency-Sensitive Workloads in vSphere VMs
- Virtualizing a Windows Active Directory Domain Infrastructure
- Guest Operating System Installation Guide
- vSphere Resource Management Guide
- Understanding Memory Management in VMware vSphere 6.0

#### Objective 3.6 – Determine Data Center Management Options for a vSphere 6.x Physical Design

***Skills and Abilities***

- Based on business requirements, determine client access options in a vSphere solution.
- Analyze business requirements when integrating vSphere with other VMware solutions.
- Evaluate the impact of the VMware Certificate Authority and the VMware Endpoint Certificate Store to the design.
- Based on the logical design and given functional requirements:
  - Determine the most appropriate datacenter management options for the design.
  - Implement the service based on the required infrastructure qualities.
- Analyze cluster requirements:
  - Availability requirements for HA and FT
  - Performance requirements for DRS and vMotion
  - Storage performance requirements for SDRS and Storage vMotion
- Determine appropriate vCenter Server design and sizing requirements:
  - vCenter Server Enhanced Linked Mode
  - vCenter Server virtual appliance vs vCenter Server for Windows
  - Platform Services Controller
- Evaluate access control methodologies for creating roles and assignment of users to roles.
- Determine proper structure for access control settings (i.e. folders, resource pools, etc.)
- Develop appropriate host and virtual machine deployment options.
- Include in the design appropriate technologies for:
  - Asset management
  - Event, incident and problem management
  - Logging, monitoring and reporting

***Tools***

- vSphere Monitoring and Performance Guide
- VMware vCenter Server 6.0 Availability Guide
- vCenter Server and Host Management Guide
- VMware vCenter Update Manager 6.0 Performance and Best Practices
- vCenter Server Deployment Guide
- VMware Interoperability Matrix
- VMware Proactive Incident Whitepaper
