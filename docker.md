# Docker cheatsheet

## How to enable connecting to docker daemon remotely

### Server 

edit the Docker service file:

```
sudo vim /usr/lib/systemd/system/docker.service
```
Add the following under the Service section:
```
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
```
Then reload everything:
```
sudo systemctl daemon-reload
sudo systemctl restart docker.service
```

### Client
Change the Docker environment varible:
```
export DOCKER_HOST=<SERVER ADDRESS>
```

## Run an image with a different architecture

```
docker run --rm multiarch/qemu-user-static --reset -p yes
```

## Copy files between host and container

In order to copy a file from a container to the host, you can use the command
```
docker cp <containerId>:/file/path/within/container /host/path/target
```
