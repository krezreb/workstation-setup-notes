


## php

`apt install php-cli php-pear php-xdebug php-codesniffer`


## ddev

https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/

`curl -fsSL https://ddev.com/install.sh | bash`


## vscode xdebug debugger `launch.json` snippet

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                # path inside container : path on your machine
                "/var/www/html": "${workspaceRoot}/matomo-org/matomo",
            }
        },{
```


Using dev and xdebug


```
ddev config
ddev start
ddev xdebug enable # gotta rerun this on every start
```

Launch debugger in vscode.

References:

- https://ddev.readthedocs.io/en/latest/users/debugging-profiling/step-debugging/
- https://stackoverflow.com/questions/49582866/setting-up-vscode-with-xdebug-pathmapping