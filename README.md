# Docker image alpine-ak-cli

A Docker container image with pre-installed Akamai Command Line Interface (CLI).

Base Linux distribution: Alpline 3.9

Main packages included:
* Python v3.6.8
* wget v1.20.3
* NodeJS v10.14.2 and NPM
* Dev libraries: libffi-dev openssl-dev python3-dev
* curl v7.64.0
* [jq](https://stedolan.github.io/jq/)
* bind-tools v9.12.2-P1 (dig)
* Akamai CLI 1.1.3
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

