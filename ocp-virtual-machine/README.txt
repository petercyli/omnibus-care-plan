This sandbox is installed Omnibus Care Plan(OCP) 1.0.0 on CentOS-7

Note that the vdi image (14 GB) is located on the OSEHRA website: url- https://osehra.org/sites/default/files/ocp-centos.vdi

Operating system: CentOS-7-x86_64-Minimal-1804.iso
Memory: 8GB
Storage Disk: 16GB
Network: Host-only Adapter 'VirtualBox Host-Only Ehternet Adapter'
IP: 192.168.99.100
CentOS user: username: ocp 
             password: ocp 
			

1. Install Oracle VM VirtualBox 
2. Open VirtualBox Manager -- > Machine --> Add --> ocp-centos.vbox
3. Start ocp-centos vertual machine
4. Please wait 10 minutes to make OCP fully function up. Access OCP by following url.
    OCP UI:      http://192.168.99.100/ocp-ui

Issues: 
1. The OCP configuration is based on the IP: 192.168.99.100. In case ip changed, please also update ip address in following file: 
        /etc/profile.d/ocp_env.sh 
		/usr/local/java/OCP_PROPS/fhir/Conformance.properties
2. If FHIR server (http://192.168.99.100:8082/fhir) can not read Conformance Statement, stop firewall by running command 'systemctl stop firewalld'.
3. If ocp-config-server not functional, fix git repository for /usr/local/java/OCP_PROPS/ocp-config-data
