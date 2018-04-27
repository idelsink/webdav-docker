# WebDAV Docker
[![](https://images.microbadger.com/badges/version/idelsink/webdav.svg)](https://microbadger.com/images/idelsink/webdav)
[![](https://images.microbadger.com/badges/image/idelsink/webdav.svg)](https://microbadger.com/images/idelsink/webdav)
[![Docker Automated build](https://img.shields.io/docker/automated/idelsink/webdav.svg)]()  
[![GitHub stars](https://img.shields.io/github/stars/idelsink/webdav-docker.svg?style=social&label=Star)]()
[![Docker Stars](https://img.shields.io/docker/stars/idelsink/webdav.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/idelsink/webdav.svg)]()

A WebDAV docker image.

## Usage

```sh
docker run --name=webdav -d -v <path to location>:/webdav -p 80:80 idelsink/webdav
```

If you want to secure it with a username and password, pass the `USERNAME` and
`PASSWORD` environment variable.
For example:

```sh
docker run --name=webdav -d -e USERNAME=user -e PASSWORD=pass -v <path to location>:/webdav -p 80:80 idelsink/webdav
```

Or using an environment variable file.
For example:

```sh
$ cat env_file
USERNAME=user
PASSWORD=pass
```

```sh
docker run --name=webdav -d --env-file=./env_file -v <path to location>:/webdav -p 80:80 idelsink/webdav
```

Using SSL (you need to have a certificate already):

```sh
# Clone the Git repository
git clone https://github.com/idelsink/webdav-docker.git

# Build an image with SSL
cd webdav-docker
docker build . --build-arg USE_SSL=true

# Copy the image name, example output: "Successfully built d2e42d2ed231"

# Run the container
docker run -d \
 --name=webdav \
 -e USERNAME=user \
 -e PASSWORD=pass \
 -v /etc/ssl/certs/home-server.pem:/etc/ssl/certs/server.pem \
 -v /etc/ssl/private/home-server.key:/etc/ssl/private/server.key \
 -v /opt/webdav/data:/webdav \
 -p 443:443 \
 ImageNameHere
```

## License

> You can check out the full license [here](./LICENSE)

This project is licensed under the terms of the **MIT** license.
