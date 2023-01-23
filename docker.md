# Docker cheatsheet

## How to enable connecting to docker daemon remotely

### Server 

### On Linux

edit the Docker service file:

```bash
sudo vim /usr/lib/systemd/system/docker.service
```
Add the following under the Service section:
```bash
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
```
Then reload everything:
```bash
sudo systemctl daemon-reload
sudo systemctl restart docker.service
```

### On Windows

Edit the file `C:\ProgramData\docker\config\daemon.json` adding the following:

```json
{
  "hosts": [
    "tcp://0.0.0.0:2375",
    "npipe:////./pipe/docker_engine_windows"
  ]
}
```

Restart the service in Powershell:

```powershell
Restart-Service docker
```
Confirm the endpoint is reachable externally:

```powershell
docker -H tcp://0.0.0.0:2375 ps
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

## Install Docker Engine on Ubuntu server
### Install the repository
```
sudo apt-get remove docker docker-engine docker.io containerd runc
```
```bash
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
### Install Docker Engine
```
sudo apt-get update
```
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
