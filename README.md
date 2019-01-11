# Docker image alpine-ak-cli

A Docker container image with pre-installed Akamai Command Line Interface (CLI).

Main packages included:
* Python v3.6.6
* wget v1.19.5
* NodeJS v8.11.4 and NPM
* Dev libraries: libffi-dev openssl-dev python3-dev
* curl v7.61.1
* bind-tools v9.12.2-P1 (dig)
* Akamai CLI 1.1.0
* Akamai edgegrid-python
* Akamai CLI packages included: image-manager, property

## Build instructions

```
$ docker build . -t alpine-ak-cli
```

## Usage 

Create a permanent Docker volume to store your credentials:
```
$ docker volume create alpine-ak-cli-volume
```

Run the container:

```
docker run --mount source=alpine-ak-cli-volume,target=/root/data -it alpine-ak-cli
```

NB: the file /root/.edgerc is a symbolic link to /root/data/.edgerc on the persistent volume.

