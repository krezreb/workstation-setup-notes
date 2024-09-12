# Below are instructions for Ubuntu 22 LTS / 24.04 LTS under gnome

- Install `ubuntu-desktop-minimal` meta package to have less cruft (like libreoffice, rythmbox), prefer to install explicitly
- install HWE kernel for better hardware support `apt install linux-generic-hwe-24.04`

## Basics / common tools

```
apt install tilix ack borgbackup  fuse3 vlc vlc-plugin-samba ack vim direnv  gnome-tweaks git make curl linux-tools-generic htop ncdu xsane xfsprogs vmtouch
apt install gimp krita inkscape zim meld evolution nemo gnome-firmware solaar cheese
# bye bye gnu nano
apt remove nano firefox libreoffice
snap install brave libreoffice firefox
snap install sublime-text --classic
```

## Other 3rd party apps
- syncthing https://apt.syncthing.net/
- keybase
- code - use github for settings sync
- signal
- virtualbox
- dbeaver
- zed
- gitlab cli https://github.com/profclems/glab/releases




## wireguard vpn client setup
ssh into pi5-bastion, grab conf using \
`make get_conf` jumi3 is client number 2

## exfat suport
```
add-apt-repository universe
apt install exfat-fuse
```

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false

## python

`apt install python3-pyfuse3 python3-pip python3-venv`

## pip stuff
`pip3 install --user azure-cli botocore fuzzywuzzy  exif   deemix   sshuttle  requests  PyYAML  pytest  pyhcl pyaml`


## gnome stuff
- multitasking
  - fixed number of workspaces
  - workspaces on all displays
- ubuntu desktop -> dock

## keyboard stuff
- **sup + up to maximize windows** -> settings -> keyboard -> view and customize shortcuts -> windows -> maximize window
- **alt tab shows icons not mini windows:** settings -> keyboard -> view and customize shortcuts -> switch applications = alt-tab

## keyboard stuff in tweaks -> keyboard -> additional layout options
- capslock behavior ->  disable caps lock
- compatibility options -> numlock always enters digits as in macos

## auto start stuff
- /usr/bin/syncthing serve --no-browser
- run_keybase

### gnome shell extensions
`apt-get install chrome-gnome-shell gnome-shell-extension-prefs`

- https://extensions.gnome.org/extension/906/sound-output-device-chooser/
- https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/

### tiling assistant
- https://extensions.gnome.org/extension/3733/tiling-assistant/

col layouts:

```
3 col layout:
0--0--0.33--1
0.33--0--0.33--1
0.66--0--0.33--1
```

## mainline kernel

Sometimes you need a more recent kernel for driver support
https://ubuntuhandbook.org/index.php/2020/08/mainline-install-latest-kernel-ubuntu-linux-mint/

## LAPTOP / POWER SAVING NOTES

### tlp + tlpui
https://github.com/d4nj1/TLPUI/blob/master/docs/INSTALL.md#pypi

### disable default gnome power saving cuz it's garbage
```
systemctl stop power-profiles-daemon
systemctl disable power-profiles-daemon
systemctl mask power-profiles-daemon
```

## install laptop tools
`apt install laptop-mode-tools powertop tlp tlp-gui`

## games

tuxtype pingus hedgewars


## vscode python debugger `launch.json` snippet

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "current file, no args",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "cwd": "${fileDirname}"
        },
        {
            "name": "current file, with args and cwd",
            ...
            "args": [
                "-d",
                "--dry"
            ],
            ...
            "cwd": "path/to/dir",
            # or using a venv
            "python": "${fileDirname}/venv/bin/python",
        }
        ...
```
