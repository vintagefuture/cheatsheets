# Docker cheatsheet

## Quickly test a Dockerfile
```
docker run --rm $(docker build -q .)
```

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

If no Docker Desktop is installed, edit the file `C:\ProgramData\docker\config\daemon.json` adding the following:

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
Allow the connection from the firewall:

```powershell
New-NetFirewallRule -DisplayName "Docker Engine" -Direction Inbound -LocalPort 2375 -Protocol TCP -Action Allow
```

If Docker Desktop *is* installed though, use the checkbox in the Docker Desktop GUI and then run from elevated prompt:

```
netsh interface portproxy add v4tov4 listenport=2375 listenaddress=192.168.0.95 connectaddress=127.0.0.1 connectport=2375
```

and restart the Docker service:

```
net stop docker && net start docker
```

Source: https://www.ibm.com/docs/en/addi/6.1.0?topic=prerequisites-configuring-docker-engine-listen-tcp-socket

Various troubleshooting commands for the above:


```
netstat -ano | findstr :2375
```

```
netsh interface portproxy show v4tov4
```

```
netsh interface portproxy delete v4tov4 listenaddress=192.168.0.237 listenport=2375
```

### Client
Change the Docker environment varible:
```
export DOCKER_HOST=<SERVER ADDRESS>
```

Or simply use `docker context`:

https://docs.docker.com/engine/context/working-with-contexts/

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

## Install Docker Desktop on Windows
To set Hyper-V backend during install, use:
```
start /w "" "Docker Desktop Installer.exe" install --backend=windows
```

To switch between linux and windows containers, use:
```
& $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchDaemon
```
also you can use:
```
‘c:\Program Files\Docker\Docker\dockercli.exe’ -SwitchWindowsEngine
‘c:\Program Files\Docker\Docker\dockercli.exe’ -SwitchLinuxEngine
```
