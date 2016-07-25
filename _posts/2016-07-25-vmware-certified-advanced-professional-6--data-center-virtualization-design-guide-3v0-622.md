---
layout: post
title: "VMware Certified Advanced Professional 6 – Data Center Virtualization Design Guide (3V0 622)"
categories:
- Certification
comments: true
---
I am about to start down my path of studying for my VCAP6-DCV Design Exam. I figured I would throw up the blueprint and fill in each section as applicable. Either way here is the blueprint laid out for anyone who may benefit. This is it as of 7/25/16.

## Section 1 – Create a vSphere Conceptual Design

#### Objective 1.1 – Gather and analyze business requirements

Skills and Abilities

- Associate a stakeholder with the information that needs to be collected.
- Utilize inventory and assessment data from a current environment to define a baseline state.
- Analyze customer interview data to explicitly define customer objectives for a conceptual design
- Determine customer priorities for defined objectives.
- Ensure that Availability, Manageability, Performance, Recoverability and Security (AMPRS) considerations are applied during the requirements gathering process.
- Given results of the requirements gathering process, identify requirements for a conceptual design.
- Categorize requirements by infrastructure qualities to prepare for logical design requirements.

Tools

- <a href="http://www.vmware.com/a/customers/product/10/VMware+vSphere">VMware Virtualization Case Studies</a>
- <a href="https://www.vmware.com/files/pdf/VMware-SMB-Survey.pdf">The Benefits of Virtualization for Small and Medium Businesses</a>
- <a href="https://communities.vmware.com/docs/DOC-17409">Functional vs. Non-Functional Requirements</a>
- <a href="https://communities.vmware.com/docs/DOC-17408">Conceptual, Logical, Physical:  It is Simple</a>
- <a href="https://blogs.vmware.com/apps/2014/02/virtualize-business-critical-applications-vsphere-updated.html">Virtualize Business Critical Applications (blog)</a>
- <a href="https://www.vmware.com/files/pdf/VMW_10Q1_WP_vSPHERE_USLET_EN_R6_proof.pdf">Virtualizing Business Critical Applications on vSphere</a>

#### Objective 1.2 – Gather and analyze application requirements

Skills and Abilities

- Gather and analyze application requirements for a given scenario.
- Determine the requirements for a set of applications that will be included in the design.
- Collect information needed in order to identify application dependencies.
- Given one or more application requirements, determine the impact of the requirements on the design.

Tools

- <a href="http://www.vmware.com/go/tcocalculator/">VMware TCO Calculator</a>
- <a href="http://www.vmware.com/files/pdf/vmware-cost-per-application-calculator-methodology.pdf">VMware Cost-Per-Application Calculator Methodology</a>
- <a href="https://www.vmware.com/business-critical-apps/oracle-virtualization/index.html">Virtualizing Oracle with VMware</a>
- <a href="http://www.vmware.com/business-critical-apps/exchange/">Virtualizing Exchange with VMware</a>
- <a href="https://www.vmware.com/business-critical-apps/sharepoint-virtualization/index.html">Virtualize SharePoint with VMware vSphere</a>
- <a href="https://www.vmware.com/business-critical-apps/sql-virtualization/overview.html">Virtualizing Microsoft SQL on VMware vSphere</a>
- <a href="https://www.vmware.com/business-critical-apps/sap-virtualization/index.html">SAP and VMware Virtualization</a>
- <a href="http://campaign.vmware.com/imgs/campaigns/business_critical_apps/phase2/assets/VMW-WP-BUS-FINANCIAL-BENEFITS-VIRT-BENCHMARK.pdf">Business and Financial Benefits of Virtualization: Customer Benchmarking Study</a>

#### Objective 1.3 – Determine Risks, Requirements, Constraints and Assumptions

Skills and Abilities

- Differentiate between the concepts of risks, requirements, constraints, and assumptions.
- Given a statement, determine whether it is a risk, requirement, constraint, or an assumption.
- Analyze impact of VMware best practices to identified risks, constraints, and assumptions.

Tools

- <a href="https://communities.vmware.com/docs/DOC-17431">Developing Your Virtualization Strategy and Deployment Plan</a>
- <a href="https://communities.vmware.com/servlet/JiveServlet/download/30463-1-144389/CADs- Constraints, Assumptions (Risk, Requirements) & Dependencies.pdf">Constraints, Assumptions (Risk, Requirements) & Dependencies</a>


### Section 2 – Create a vSphere 6.x Logical Design from an Existing Conceptual Design

#### Objective 2.1 – Map Business Requirements to a vSphere 6.x Logical Design

Skills and Abilities

- Analyze requirements for functional and non-functional elements.
- Build non-functional requirements into a specific logical design.
- Translate stated business requirements into a logical design.
- Incorporate the current state of a customer environment into a logical design.

Tools

- <a href="https://communities.vmware.com/docs/DOC-17408">Conceptual, Logical, Physical:  It is Simple</a>
- <a href="http://www.vmware.com/files/pdf/vsphere/VMware-vSphere-Platform-Whats-New.pdf">What’s New in VMware vSphere 6.0</a>
- <a href="https://communities.vmware.com/docs/DOC-17409">Functional vs. Non-Functional Requirements</a>
- <a href="https://communities.vmware.com/docs/DOC-17410">ITIL v3 Introduction and Overview</a>
- <a href="http://www.bredemeyer.com/pdf_files/ActionGuides/ConceptualArchitectureActionGuide.PDF">Conceptual Architecture Action Guide</a>
- <a href="http://it.toolbox.com/blogs/bridging-gaps/systems-architecture-fundamentals-conceptual-logical-physical-designs-11352">Systems Architecture Fundamentals – Conceptual, Logical, Physical Designs</a>

#### Objective 2.2 – Map Service Dependencies

Skills and Abilities

- Evaluate dependencies for infrastructure and application services that will be included in a vSphere design.
- Create Entity Relationship Diagrams that map service relationships and dependencies.
- Analyze interfaces to be used with new and existing business processes.
- Determine service dependencies for logical components.
- Include service dependencies in a vSphere 6.x Logical Design.
- Analyze services to identify upstream and downstream service dependencies.
- Navigate logical components and their interdependencies and make decisions based upon all service relationships.

Tools

- <a href="http://www.vmware.com/files/pdf/vmware-vcenter-app-discovery-mgr-datacenter-ops-WP-EN.pdf">Datacenter Operational Excellence Through Automated Application Discovery & Dependency Mapping</a>
- <a href="http://vbikerblog.com/2014/11/05/vmware-application-dependencies-and-entity-relationship-diagrams-mk2/">VMware Application Dependencies and Entity Relationship Diagrams MK2</a>

#### Objective 2.3 – Build Availability Requirements into a vSphere 6.x Logical Design

Skills and Abilities

- Evaluate which logical availability services can be used with a given vSphere solution.
- Differentiate infrastructure qualities related to availability.
- Describe the concept of redundancy and the risks associated with single points of failure
- Explain class of nines methodology
- Determine availability component of service level agreements (SLAs) and service level management processes
- Determine potential availability solutions for a logical design based on customer requirements.
- Create an availability plan, including maintenance processes.
- Balance availability requirements with other infrastructure qualities.
- Analyze a vSphere design and determine possible single points of failure.

Tools

- <a href="http://www.vmware.com/files/pdf/vmware-vcenter-app-discovery-mgr-datacenter-ops-WP-EN.pdf">Datacenter Operational Excellence Through Automated Application Discovery & Dependency Mapping</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-availability-guide.pdf">vSphere Availability Guide</a>
- <a href="http://www.vmware.com/files/pdf/smb/VMware-Protect-Your-Business-with-Automated-Business-Continuity-Solutions_Mar13.pdf">Protect Your Business with Automated Business Continuity Solutions</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/vmw-vsphere-high-availability.pdf">VMware High Availability Deployment Best Practices</a>

#### Objective 2.4 – Build Manageability Requirements into a vSphere 6.x Logical Design

Skills and Abilities

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

Tools

- <a href="https://communities.vmware.com/docs/DOC-17396">Optimizing Your VMware Environment</a>
- <a href="https://communities.vmware.com/docs/DOC-17397">Four Keys to Managing Your VMware Environment</a>
- <a href="http://communities.vmware.com/docs/DOC-11457">Operational Readiness Assessment</a>
- <a href="http://communities.vmware.com/servlet/JiveServlet/download/11457-1-32094/VMware_OR_Self_Assessment.xls">Operational Readiness Assessment Tool</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-host-management-guide.pdf">vCenter Server and Host Management Guide</a>
- <a href="https://www.vmware.com/support/developer/PowerCLI/">vSphere PowerCLI documentation Center</a>

#### Objective 2.5 – Build Performance Requirements into a vSphere 6.x Logical Design

Skills and Abilities

- Evaluate logical performance considerations for a given vSphere solution.
- Differentiate infrastructure qualities related to performance.
- Analyze current performance, identify and address gaps when building the logical design
- Using a conceptual design, create a logical design that meets performance requirements
- Determine performance-related functional requirements based on given non-functional requirements and service dependencies.
- Define capacity management practices and create a capacity plan
- Incorporate scalability requirements into the logical design
- Determine a performance component for service level agreements and service level management processes.

Tools

- <a href="https://communities.vmware.com/docs/DOC-11484">Proven Practice: Implementing ITIL v3 Capacity Management in a VMware environment</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-monitoring-performance-guide.pdf">vSphere Monitoring and Performance Guide</a>

#### Objective 2.6 – Build Recoverability Requirements into a vSphere 6.x Logical Design

Skills and Abilities

- Evaluate which logical recoverability services are available for a given vSphere solution.
- Differentiate infrastructure qualities related to recoverability.
- Determine Business Continuity and Disaster Recovery solution options for a given vSphere Design.
- Given recoverability requirements, analyze services that will be impacted and provide a recovery plan for impacted services.
- Plan a data retention policy based on customer requirements.

Tools

- <a href="http://www.vmware.com/files/pdf/products/SRM/VMware-vCenter-Site-Recovery-Manager-Evaluation-Guide.pdf">VMware vCenter™ Site Recovery Manager Evaluation Guide</a>
- <a href="http://www.vmware.com/files/pdf/practical_guide_bcdr_vmb.pdf">A Practical Guide to Business Continuity and Disaster Recovery with VMware Infrastructure</a>
- <a href="http://download3.vmware.com/elq/img/EMEA/EMEA11122/pdf/VirtMngt_MasteringDisasterRecovery_WhitePaper_Q410_EN.pdf?cid=70180000000wCtz">Mastering Disaster Recovery:  Business Continuity and Virtualization Best Practices Whitepaper</a>

#### Objective 2.7 – Build Security Requirements into a vSphere 6.x Logical Design

Skills and Abilities

- Evaluate which security services can be used with a given vSphere solution. &nbsp;
- Differentiate infrastructure qualities related to security.
- Build specific regulatory compliance requirements into the logical design.
- Analyze application and infrastructure security requirements.
- Build a role-based access model and map roles to services.
- Build a security policy based on existing security requirements and IT governance practices.
- Incorporate customer risk tolerance into the security policy.
- Assess the services that will be impacted and create an access management plan.
- Determine the proper security solution that would satisfy a regulatory requirement.
- Based on stated security requirements, analyze the current state for compliance/non-compliance.

Tools

- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-security-guide.pdf">vSphere Security Guide</a>
- <a href="https://communities.vmware.com/docs/DOC-17431">Developing Your Virtualization Strategy and Deployment Plan</a>
- <a href="http://www.vmware.com/files/pdf/technology/compliance_virtualized_environment_wp.pdf">Achieving Compliance in a Virtualized Environment</a>
- <a href="http://www.vmware.com/files/pdf/cloud/vmware-cloud-solution-security-in-the-cloud-wp-en.pdf">Infrastructure Security:  Getting to the Bottom of Compliance in the Cloud</a>
- <a href="http://www.vmware.com/files/pdf/cloud/VMware-Savvis-Cloud-WP-en.pdf">Securing the Cloud</a>

### Section 3 – Create a vSphere 6.x Physical Design from an Existing Logical Design

#### Objective 3.1 – Transition from a Logical Design to a vSphere 6.x Physical Design

Skills and Abilities

- Analyze design decisions and options selected from the logical design
- Determine impact of VMware best practices to identified risks, constraints, and assumptions in a given vSphere design.
- Based on business requirements, determine the appropriate roles for each staff member.

Tools

- <a href="https://communities.vmware.com/docs/DOC-17408">Conceptual, Logical, Physical:  It is Simple</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-host-management-guide.pdf">vSphere Server and Host Management Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-virtual-machine-admin-guide.pdf">vSphere Virtual Machine Administration Guide</a>

#### Objective 3.2 – Create a vSphere 6.x Physical Network Design from an Existing Logical Design

Skills and Abilities

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
- Determine the most appropriate networking technologies for the design
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

Tools

- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-host-management-guide.pdf">vSphere Server and Host Management Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-installation-setup-guide.pdf">vSphere Installation and Setup Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-networking-guide.pdf">vSphere Networking Guide</a>
- <a href="http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2131180">Network Port Diagram for vSphere 6.x</a>
- <a href="http://www.vmware.com/files/pdf/products/vsan/VSAN_Design_and_Sizing_Guide.pdf">VMware Virtual SAN Network Design Guide</a>
- <a href="http://www.vmware.com/files/pdf/VMware-vSphere-PNICs-perf.pdf">Leveraging NIC Technology to Improve Network Performance in VMware vSphere</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/Network-IOC-vSphere6-Performance-Evaluation.pdf">Performance Evaluation of Network I/O Control in VMware vSphere 6</a>
- <a href="http://www.vmware.com/files/pdf/vmotion-perf-vsphere5.pdf">vMotion Architecture, Performance and Best Practices in VMware vSphere 5</a>

#### Objective 3.3 – Create a vSphere 6.x Physical Storage Design from an Existing Logical Design

Skills and Abilities

- Evaluate criteria, capabilities and limitations between storage types (Block, NAS, Object Based)
- In a given design, determine Storage Policy availability and performance characteristics
- Based on the logical design and given functional requirements, for each service:
- Determine the most appropriate storage technologies for the design
- Implement the service based on the required infrastructure qualities
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
- Object Based (Virtual SAN, Virtual Volumes

Tools

- <a href="http://www.vmware.com/files/pdf/products/vsan/VMware_Virtual_SAN_Whats_New.pdf">What’s New: VMware Virtual SAN 6.0</a>
- <a href="https://www.vmware.com/files/pdf/products/vsan/VSAN_Design_and_Sizing_Guide.pdf">VMware Virtual SAN 6.0 Design and Sizing Guide</a>
- <a href="https://www.vmware.com/files/pdf/products/vsan/VSAN-Troubleshooting-Reference-Manual.pdf">VMware Virtual SAN Diagnostics and Troubleshooting Reference Manual</a>
- <a href="http://www.vmware.com/files/pdf/solutions/VMware-Perspective-on-software-defined-storage-white-paper.pdf">The VMware Perspective on Software-Defined Storage</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-storage-guide.pdf">vSphere Storage</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-resource-management-guide.pdf">Resource Management Guide</a>
- <a href="https://vsantco.vmware.com/vsan/SI/SIEV">Virtual SAN TCO and Sizing Calculator</a>
- <a href="http://www.vmware.com/files/pdf/products/virtualvolumes/VMware-Whats-New-vSphere-Virtual-Volumes.pdf">What’s New: VMware vSphere Virtual Volumes</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-installation-setup-guide.pdf">vSphere Installation and Setup Guide</a>
- <a href="http://www.vmware.com/pdf/vmfs-best-practices-wp.pdf">VMware Virtual Machine File System: Technical Overview and Best Practices</a>

#### Objective 3.4 – Determine Appropriate Compute Resources for a vSphere 6.x Physical Design

Skills and Abilities

- Analyze best practices with respect to CPU family choices.
- Evaluate NUMA and vNUMA with ESXi hosts and Virtual machines in a given design.
- Analyze the following in a vSphere design:
- Enhanced vMotion compatibility
- Implications of vSMP in virtual machines
- Transparent Page Sharing (TPS) and large pages
- Resource overcommitment
- Based on the service catalog and given functional requirements:
- Determine the most appropriate compute technologies for the design
- Implement the service based on the required infrastructure qualities.
- Determine the impact of a technical design on the choice of server density:
- Scale Up/Out
- Auto Deploy
- Calculate the required number of nodes in an HA cluster based upon host failures and resource guarantees
- Evaluate the implications of using reservations, limits, and shares on the physical design.
- Specify the resource pool and vApp configuration based upon resource requirements.
- Size the following resources appropriately:
- Memory
- CPU
- I/O devices
- Internal storage
- Given a constraint to use existing hardware, determine suitability of the hardware for the design.

Tools

- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-host-management-guide.pdf">vSphere Server and Host Management Guide</a>
- <a href="http://www.vmware.com/files/pdf/vsphere/VMware-vSphere-Platform-Whats-New.pdf">What’s New in the VMware vSphere® 6.0 Platform</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-installation-setup-guide.pdf">vSphere Installation and Setup Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-resource-management-guide.pdf">vSphere Resource Management Guide</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/VMware-PerfBest-Practices-vSphere6-0.pdf">Performance Best Practices for VMware vSphere 6.0</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/vmware-vCenter6-perf.pdf">VMware vCenter Server Performance and Best Practices</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/VMW-Tuning-Latency-Sensitive-Workloads.pdf">Best Practices for Performance Tuning of Latency-Sensitive Workloads in vSphere VMs</a>
- <a href="http://www.vmware.com/files/pdf/solutions/VMware-SQL-Server-vSphere6-Performance.pdf">Performance Characterization of Microsoft SQL Server on VMware vSphere 6 </a>
- <a href="http://www.vmware.com/files/pdf/Exchange_2013_on_VMware_Best_Practices_Guide.pdf">Microsoft Exchange 2013 on VMware Best Practices Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-monitoring-performance-guide.pdf">vSphere Monitoring and Performance Guide</a>
- <a href="https://communities.vmware.com/docs/DOC-9279">Interpreting esxtop statistics</a>

#### Objective 3.5 – Determine Virtual Machine Configuration for a vSphere 6.x Physical Design

Skills and Abilities

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

Tools

- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-virtual-machine-admin-guide.pdf">Virtual Machine Administration Guide</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/VMW-Tuning-Latency-Sensitive-Workloads.pdf">Best Practices for Performance Tuning of Latency-Sensitive Workloads in vSphere VMs</a>
- <a href="http://www.vmware.com/files/pdf/Virtualizing_Windows_Active_Directory.pdf">Virtualizing a Windows Active Directory Domain Infrastructure</a>
- <a href="http://partnerweb.vmware.com/GOSIG/home.html">Guest Operating System Installation Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-resource-management-guide.pdf">vSphere Resource Management Guide</a>
- <a href="http://www.vmware.com/files/pdf/mem_mgmt_perf_vsphere5.pdf">Understanding Memory Management in VMware vSphere 6.0</a>

#### Objective 3.6 – Determine Data Center Management Options for a vSphere 6.x Physical Design

Skills and Abilities

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

Tools

- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-monitoring-performance-guide.pdf">vSphere Monitoring and Performance Guide</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/VMware-vCenter-Server-6-0-Availability-Guide.pdf">VMware vCenter Server 6.0 Availability Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-60-host-management-guide.pdf">vCenter Server and Host Management Guide</a>
- <a href="http://pubs.vmware.com/vsphere-60/topic/com.vmware.ICbase/PDF/vsphere-update-manager-60-install-administration-guide.pdf">VMware vCenter Update Manager 6.0 Performance and Best Practices</a>
- <a href="http://www.vmware.com/files/pdf/techpaper/vmware-vcenter-server6-deployment-guide.pdf">vCenter Server Deployment Guide</a>
- <a href="http://www.vmware.com/resources/compatibility/sim/interop_matrix.php">VMware Interoperability Matrix</a>
- <a href="http://www.vmware.com/files/pdf/services/VMware-Proactive-Incident-Whitepaper.pdf">VMware Proactive Incident Whitepaper</a>
