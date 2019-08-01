## Setting up Kubernetes Cluster
## https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm
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