$test=@"
{
    "hosts":  [
                  "npipe://",
			        "tcp://0.0.0.0:2375"
              ]
}
"@

New-Item -Type directory C:\ProgramData\docker\config
echo $test > C:\ProgramData\docker\config\daemon.json
restart-service docker
