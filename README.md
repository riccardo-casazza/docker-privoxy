

# ziobombo/privoxy:1.0

- [Introduction](#introduction)
  - [Contributing](#contributing)
  - [Issues](#issues)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Usage](#usage)
  - [Logs](#logs)
- [Maintenance](#maintenance)
  - [Upgrading](#upgrading)
  - [Shell Access](#shell-access)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Privoxy](https://www.privoxy.org/).

Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data and HTTP headers, controlling access, and removing ads and other obnoxious Internet junk.

## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your awesome features and bug fixes
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).

## Issues

Before reporting your issue please try updating Docker to the latest version and check if it resolves the issue. Refer to the Docker [installation guide](https://docs.docker.com/installation) for instructions.

SELinux users should try disabling SELinux using the command `setenforce 0` to see if it resolves the issue.

If the above recommendations do not help then [report your issue](../../issues/new) along with the following information:

- Output of the `docker version` and `docker info` commands
- The `docker run` command or `docker-compose.yml` used to start the image. Mask out the sensitive bits.

# Getting started

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/ziobombo/privoxy) and is the recommended method of installation.


```bash
docker pull ziobombo/privoxy:latest
```

Alternatively you can build the image yourself.

```bash
docker build -t ziobombo/privoxy github.com/ziobombo/docker-privoxy
```

## Quickstart

Start privoxy using:

```bash
docker run -d \
  --name=privoxy \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Paris \
  -p 8118:8118 \
  -v <path to data>:/config \
  --restart always \
  ziobombo/privoxy
```

*Alternatively, you can use the sample [docker-compose.yml](docker-compose.yml) file to start the container using [Docker Compose](https://docs.docker.com/compose/)*

## Usage

Configure your web browser network/connection settings to use the proxy server which is available at `<ip>:8118`

If you are using Linux then you can also add the following lines to your `.bashrc` file allowing command line applications to use the proxy server for outgoing connections.

```bash
export ftp_proxy=http://<ip>:8118
export http_proxy=http://<ip>:8118
export https_proxy=http://<ip>:8118
```

## Logs

To access the Privoxy logs, you can use:

```bash
docker logs -f privoxy
```

# Maintenance

## Upgrading

To upgrade to newer releases:

  1. Download the updated Docker image:

  ```bash
  docker pull ziobombo/privoxy:latest
  ```

  2. Stop the currently running image:

  ```bash
  docker stop privoxy
  ```

  3. Remove the stopped container

  ```bash
  docker rm -v privoxy
  ```

  4. Start the updated image

  ```bash
  docker run -name privoxy -d \
    [OPTIONS] \
    ziobombo/privoxy:latest
  ```

## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version `1.3.0` or higher you can access a running containers shell by starting `bash` using `docker exec`:

```bash
docker exec -it privoxy bash
```