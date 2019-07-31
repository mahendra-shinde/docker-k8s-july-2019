## Creating IIS Web Application containers


1.  Ensure that, you are running Docker in Windows mode or Azure Windows VM
2.  Pull IIS Server base image
    $ docker pull mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

3.  Check if Image is downloaded:
    $ docker images

4.  Lets create FIRST container:
    $ docker run --name c1 -d -p 8080:80 mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

5.  Open web browser try URL
    http://localhost:8080

6.  Lets create SECOND container:
    $ docker run --name c2 -d -p 8081:80 mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

7.  Open web browser try URL
    http://localhost:8081

8.  Check Disk/Storage Utilization:
    $ docker system df

9.  Modify container 2
    Execute a command inside a running container.
    
    $ docker exec -it c2 cmd
    $ cd inetput\wwwroot
    $ echo "<h2>Hello World</h2>" > index.htm
    $ exit

10. Open web browser try URL
    http://localhost:8081




