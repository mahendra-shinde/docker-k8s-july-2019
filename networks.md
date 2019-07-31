## Creating and managing container networks

Bridge Network: Default for Single Host deployment.
NOTE: Check available network plugins using `docker info` command.

1.  Create new Bridge network
    $ docker network create -d l2bridge net1 --subnet 10.0.0.0/24

2.  Create container inside bridge

    $ docker run -it --network net1 microsoft/nanoserver:latest cmd
    $ ipconfig
    $ exit

2.  Create a transparent network (Windows Host)
    $ docker network create -d transparent net2

3.  Create a container inside transparent network

    $ docker run -it --network net2 microsoft/nanoserver:latest cmd
    $ ipconfig
    $ exit