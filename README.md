# WebDAV Docker

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
docker run --name=webdav -d –env-file env_file -v <path to location>:/webdav -p 80:80 idelsink/webdav
```

## License

> You can check out the full license [here](./LICENSE)

This project is licensed under the terms of the **MIT** license.
