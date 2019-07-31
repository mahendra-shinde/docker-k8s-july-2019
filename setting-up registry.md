Docker Registries:

1.  Pull registry

    $ docker pull registry

2.  Launch registry:

    $ docker run --name myreg -d -p 5000:5000 registry

3.  Uploading the local images

    $ docker tag oldimage 10.0.0.57:5000/imagename:tag
    $ docker push 10.0.0.57:5000/imagename:tag