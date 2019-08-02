## Helm Charts

A Package manager for Kubernetes. Treat kubernetes deployments as "packages" which could be stored, shared & reused.

## Installing Helm Charts

## Pre-requisites
1. kubectl installed
2. .kube/config must be downloaded and cluster accessible.

### To Check Pre-reqsuisites:
```
$ kubectl cluster-info
```

> IF the above command fails, setup kubectl and kube config.

1. Download the "helm" client tool (CLI) 
    https://get.helm.sh/helm-v2.14.3-windows-amd64.zip

2.  Extract the contents of ZIP into some directory eg, c:\helm

3.  Initialize the helm server component (Tiller)

    ```
    $ helm init
    ```

4.  To download usable charts (packages) use command:

    ```
    $ helm search mssql
    ## Download the Archive
    $ helm fetch stable/mssql-linux
    ## Deploy on cluster
    $ helm install stable/mssql-linux
    ```



