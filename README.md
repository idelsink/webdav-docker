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

### Read and write (Experimental)

When no `APACHE_GID` or `APACHE_UID` is supplied, the default of the system will be used and nothing will be changed.

Using the `APACHE_GID` and `APACHE_UID` environment vatiables, the `GID` and the `UID` can be set for the Apache user.
This makes sure that the apache user will have the same UID or GID as the owner of the volume mount.

For example, to make sure that the data in the volume mount will have the same UID and GID as the user running the `docker run` command,
run the following `docker run` command:

```sh
docker run --name=webdav -d -e APACHE_UID=`id -u` -e APACHE_GID==`id -g`  -v <path to location>:/webdav -p 80:80 idelsink/webdav
```

## License

> You can check out the full license [here](./LICENSE)

This project is licensed under the terms of the **MIT** license.
