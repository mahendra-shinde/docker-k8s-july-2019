1.  Use Docker Desktop on Linux Mode
2.  Pull the required image
    $ docker pull mahendrshinde/hostname:node

3.  Create and Run container in DETACHED mode, also MAP local port
    8080 to container port 3000.
    $ docker run --name c2 -d -p 8080:3000 mahendrshinde/hostname:node

4.  To verify that, container is indeed RUNNING!

    $ docker ps

5.  To List all processes inside the container:

    $ docker top c2

6.  Open web browser and try URL:   http://localhost:8080

7.  Create another container from same image but different name and local port:
    
    $ docker run --name c3 -d -p 8081:3000 mahendrshinde/hostname:node
