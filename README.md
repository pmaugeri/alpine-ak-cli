# Docker image alpine-ak-cli

An experimental project to build a Docker container image with pre-installed Akamai Command Line Interface (CLI).

**Nota Bene:** if you are looking for the official Akamai Docker image with CLI, you should check out [akamai/cli](https://github.com/akamai/cli) repository.

Main packages included:
* Python v3.6.6
* wget v1.19.5
* NodeJS v8.11.4 and NPM
* Dev libraries: libffi-dev openssl-dev python3-dev
* curl v7.61.1
* [jq v1.6-r0](https://stedolan.github.io/jq/)
* bind-tools v9.12.2-P1 (dig)
* Akamai CLI 1.1.2
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

