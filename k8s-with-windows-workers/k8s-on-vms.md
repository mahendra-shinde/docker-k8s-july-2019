## Setting up Kubernetes Cluster

### https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm

1. Create Resource Group 
        Name: k8s-Cluster
        Location: Southeast asia

2. Create Virtual Network
    Create Resource > Networking > Virtual Network
        Network Name:   cluster-Net
        IP Range:       182.18.0.0/16
        Resource group: k8s-cluster
        Subnet:         182.18.0.0/24

3.  Create new VM 
        VM Name:    master1
        Ports:      SSH (22)
        Username:   mahendra
        Password:   <Password>
        Network:    cluster-net
        OS Disk:    Standard HDD (To Save cost!)

4.  Once VM is Provisioned, Connect using Putty or Git Bash

5.  Install Container Runtime : Docker
    ```bash
    $ sudo apt update -y
    $ sudo apt install docker.io -y
    ## Add current user to 'docker' user group
    ## to avoid using 'sudo' prefix for every docker cli command
    ## You need to reconnect your remote session (No need for VM Restart!)
    $ sudo usermod -aG docker $USER
    ```

6.  Install Kubernetes from official repositories
    
    ```bash
    ## Switch to ROOT user for Installation
    sudo -i
    ## Install GPG Key (Encryption key) to VALIDATE kubernetes repository packages
    apt-get update && apt-get install -y apt-transport-https curl
    ## Add kubernetes repo URL in System package manager
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
    deb https://apt.kubernetes.io/ kubernetes-xenial main
    EOF
    ## Update packages (Read Package repository URLS and download files)
    apt-get update
    ## Install the files downloaded by previous command
    apt-get install -y kubelet kubeadm kubectl
    ## Freez the package versions (To Avoid auto-update of these packages)
    apt-mark hold kubelet kubeadm kubectl
    ## Exit from ROOT user
    exit
    ```

7.  Set docker daemon to start on OS Boot

    $ sudo systemctl enable docker

8.  Bootstrap a cluster (Wait for cluster to be ready)

    $ sudo kubeadm init --pod-network-cidr=10.244.0.0/16

    Command should generate TOKEN for adding worker nodes.

9.  Copy the kubeconfig from ROOT folder to USER'S home folder

    ```bash
    mkdir -p $HOME/.kube                                                         sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config                     sudo chown $(id -u):$(id -g) $HOME/.kube/config 
    ```

10. Test the cluster using kubectl

    ```bash
    $ kubectl get nodes
    ```

    NOTE: Your nodes are NOT READY, you need to install CNI Network plugin.

11. Install the Network plugin 

    Ref: [Kubernetes Docs](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
    
    ## Default firewall (iptables) would block the the packets
    ## Unblock using following command
    $ sudo sysctl net.bridge.bridge-nf-call-iptables=1

12. Click [here](./kube-flannel.yml) for the modified flannel deployment file.

    To download this file on ubuntu VM, try following command:
    ```bash
    wget 
    ```

    

13. Once the file is open, locate the following section of file, and modify it:

    > OLD FILE
    ```json
    net-conf.json: |
    {
      "Network": "10.244.0.0/16",
      "Backend": {
        "Type": "vxlan"
      }
    }
    ```

    > NEW FILE
    ```json
    
    ```

    > Notice the Backend type and Network IP range. The IP range MUST match with `pod-network-cidr` used with `kubeadm init` command. 
    > You need to set TWO port mappings VNI and Port to values 4096 and 4789 respectivally.


### Phase II  : Adding Windows Worker nodes

1.  Create a new `Windows Server 2019 Datacenter with Containers` VM. in same resource group as the Ubuntu (Master) VM.

2.  Download the necessary kubernetes binaries from URL:

    https://dl.k8s.io/v1.15.0/kubernetes-node-windows-amd64.tar.gz 

    > The above url would allow you to download k8s api version 1.15.1
      In case URL is inaccessible, try visiting [this](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.15.md#v1151) page.

3.  Extract the contents of downloaded file.
4.  Connect to Windows Server VM using RDP and copy all extracted files inside your Windows VM (Create a folder: c:\k8s as target for files).
5.   