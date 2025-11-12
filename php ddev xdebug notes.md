


## php

`apt install php-cli php-pear php-xdebug php-codesniffer composer`


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

## zed xdebug debugger `debug.json` snippet

```
{
      "label": "Xdebug in DDEV",
      "adapter": "Xdebug",
      "request": "launch",
      "port": 9003,
      "pathMappings": {
        "/var/www/html": "/path/to/dir",
        "/var/www/html/plugins/dir": "/path/to/dir/2"
      }
    }
```

Using dev and xdebug

```
ddev config
ddev start
ddev xdebug enable # gotta rerun this on every start
```

cli command debugging

`ddev exec XDEBUG_TRIGGER=1 php ...`

Launch debugger in vscode.

References:

- https://ddev.readthedocs.io/en/latest/users/debugging-profiling/step-debugging/
- https://stackoverflow.com/questions/49582866/setting-up-vscode-with-xdebug-pathmapping


# phpcs / costing standards setup for matomo

```
composer config repositories.matomo-cs vcs https://github.com/matomo-org/matomo-coding-standards

composer require --dev matomo-org/matomo-coding-standards:dev-master   squizlabs/php_codesniffer:^3 slevomat/coding-standard:^8   dealerdirect/phpcodesniffer-composer-installer:^1

vendor/bin/phpcs -i
vendor/bin/phpcbf .
```
