## Dockerfile

This is a Dockerfile, which contains a set of instructions for building a Docker image. 

The first line specifies the base image to use, which in this case is the Rocky Linux 8. 

The following `RUN` instructions execute shell commands in the image's environment. In this case, the commands do the following:

- Copy the `nginx.repo` file to the `/etc/yum.repos.d/` directory
- Update the package manager (`dnf`)
- Install the EPEL (Extra Packages for Enterprise Linux) repository
- Install the Remi repository
- Reset the PHP module
- Install the PHP module for Remi version 8.2
- Update and upgrade the package manager again
- Install PHP and Nginx
- Install the Supervisor process control system
- Create directories `/home/www` and `/run/php-fpm`
- Copy configuration files (`nginx.conf`, `www.conf`, `default.conf`, and `supervisord.conf`) to their respective locations

The `CMD` instruction sets the default command that will be executed when a container is started from the image. In this case, it starts the `supervisord` process and uses the configuration file `/etc/supervisord.conf`

In summary, this Dockerfile builds an image that installs PHP, Nginx, and Supervisor, and sets up configuration files for these components. When a container is started from this image, it will start the Supervisor process control system, which will manage the PHP and Nginx processes.

## How to build

To build the Dockerfile, you can use the `docker build` or `podman build` command in the directory containing the Dockerfile:

```bash
docker build -t my-web-server .
podman build -t my-web-server .
```

This command will build the Dockerfile and create an image with the tag `(-t)` my-web-server and store in your local device.<br/>
The dot at the end of the command represents the current directory.

## How to run

To run a container from the image, you can use the `docker run` or `podman run` command:

```bash
docker run -d -p 80:80 localhost/my-web-server
podman run -d -p 80:80 localhost/my-web-server
```

This command will start a container from the my-web-server image in detached mode `(-d)`, meaning it will run in the background.<br/>
It will also map port 80 from the container to port 80 `(-p)`

## How to go in

To execute commands in a running Docker container, you can use the `docker exec` or `podman exec` command. 

```bash
docker exec -it <container id> /bin/bash
podman exec -it <container id> /bin/bash
```

The `-it` option specifies that the command should be run interactively in the container's terminal.

## Reading logs

To see the logs of a running Docker container, you can use the `docker logs` command.

```bash
docker logs -l
podman logs -l
```

This shows the logs of the last container started, regardless of whether it is still running or not. The `-l` option stands for "latest" and is equivalent to specifying the container ID or name as an argument.
