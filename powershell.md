## Add Vim to Powershell

Install Chocolatey package manager (yes, you need a third-party package manager for something that simple—stupid, stupid Microsoft):
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Install vim:
```
choco install vim -y
```
