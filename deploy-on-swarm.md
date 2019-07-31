1. Created a new Docker-compose file for deploying single service:

    ```yaml
    version: "3"

    services:
        app1:
            image: mcr.microsoft.com/windows/servercore/iis
        deploy:
            replicas: 3
            placement:
                constraints:
                - node.role == worker		        
    ```

2.  From command line use 

    $ docker stack deploy --compose-file docker-compose.yaml app

3.  Check Deployment status
    $ docker stack ls
    $ docker stack ps app
