## Docker EE
1. Visit docker.com for enterprise trial

    https://hub.docker.com/editions/enterprise/docker-ee-trial 

2.  Create new Ubuntu VM Using Azure portal in same resource group

3.  Connect VM using SSH client (Git Bash or Ubuntu bash on Windows 10 or Putty)

4.  Visit URL for Steps to Install Docker EE on Linux

    https://docs.docker.com/install/linux/docker-ee/ubuntu/ 

    https://docs.docker.com/install/linux/docker-ee/centos/

    https://docs.docker.com/install/linux/docker-ee/rhel/
    
5.  You need Docker EE package repository URL to download and install docker-ee
    Get that URL from    https://hub.docker.com/my-content

    Repository URL should be at lower right corner of page
    ![](repo-url.png)

6.  Install pre-requisites

    $ sudo apt-get update
    $ sudo apt-get install \
        apt-transport-https \   
        ca-certificates \
        curl \
        software-properties-common
    $ DOCKER_EE_URL=19.03

7.  Download Package Key (GPG) to download signed packages
    $ curl -fsSL "${DOCKER_EE_URL}/ubuntu/gpg" | sudo apt-key add -

    OPTIONAL: Validate the GPG Key
    $ sudo apt-key fingerprint 6D085F96

8.  Start the actual installation

    $ sudo add-apt-repository \
        "deb [arch=$(dpkg --print-architecture)] $DOCKER_EE_URL/ubuntu \
        $(lsb_release -cs) \
        stable-$DOCKER_EE_VERSION"

    $ sudo apt update
    $ sudo apt install docker-ee docker-ee-cli containerd.io

9.  For Azure VM, Goto Public IP and Set custom DNS name
    ex: max123 would become max123.southeastasia.cloudapp.azure.com

10. Run following command inside the Ubuntu VM (Please change IP 10.0.0.6 to real IP)
    ```
    $ sudo docker container run --rm -it --name ucp   -v /var/run/docker.sock:/var/run/docker.sock   docker/ucp:3.2.0 install   --host-address 10.0.0.6    --interactive --cloud-provider azure
    ```

11. Open web browser and visit your VM's DNS name
    ex: max123 would become max123.southeastasia.cloudapp.azure.com

    NOTE: You have to open "Inbound port 443" from Network Security Groups.