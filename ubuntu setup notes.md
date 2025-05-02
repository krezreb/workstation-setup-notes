# Below are instructions for Ubuntu 22 LTS / 24.04 LTS / 24.10 under gnome

- Install `ubuntu-desktop-minimal` meta package to have less cruft (like libreoffice, rythmbox), prefer to install explicitly
- install HWE kernel for better hardware support `apt install linux-generic-hwe-24.04`

## Basics / common tools

```
apt install -y \
tilix ack borgbackup  fuse3 vlc vlc-plugin-samba ack vim direnv nmap net-tools gnome-tweaks git make curl linux-tools-generic htop ncdu xsane xfsprogs jq tmux \
gimp krita inkscape zim meld evolution nemo gnome-firmware solaar cheese obs-studio
# bye bye gnu nano
apt remove nano totem*
snap install brave libreoffice firefox
snap install sublime-text --classic
```

# brave

`curl -fsS https://dl.brave.com/install.sh | sh`

## wireguard for ubuntu 22.04

`apt install resolvconf wireguard`

save wg conf to /etc/wireguard/<name>.conf

Bring up interface

`wg-quick up <name>`

Turn off

`wg-quick down <name>`

## remote encrypted git

https://flolu.de/blog/encrypted-git-repository

## Other 3rd party apps
- syncthing https://apt.syncthing.net/
- code - https://code.visualstudio.com/download use github for settings sync
- signal
- virtualbox
- dbeaver - https://dbeaver.io/download/
- zed
- gitlab cli https://github.com/profclems/glab/releases
- obs-studio for screenrecordings https://obsproject.com/download
- shotcut for video editing


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

### pip stuff
`pip3 install --user  boto3 fuzzywuzzy  exif   deemix   sshuttle  requests  PyYAML  pytest  pyhcl pyaml`

## aws stuff

`snap install aws-cli --classic`

### ssm plugin

https://docs.aws.amazon.com/systems-manager/latest/userguide/install-plugin-debian-and-ubuntu.html
`curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"`

## docker

```
 for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

```
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh --dry-run
```

Add user to docker group

`usermod -a -G docker <user>`


## gnome stuff
- multitasking
  - fixed number of workspaces
  - workspaces on all displays
- ubuntu desktop -> dock

## keyboard stuff
- **sup + up to maximize windows** -> settings -> keyboard -> view and customize shortcuts -> windows -> maximize window
- **alt tab shows icons not mini windows:** settings -> keyboard -> view and customize shortcuts -> switch applications = alt-tab

## keyboard stuff in tweaks -> keyboard -> additional layout options
- compatibility options -> numlock always enters digits as in macos

## remap capslock to tmux's C-b

```
sudo add-apt-repository ppa:keyd-team/ppa
apt install keyd
```

`vim /etc/keyd/default.conf`

```
[ids]
*
[main]
capslock = macro(C-b)
```

`systemctl enable keyd --now`

## auto start stuff
- /usr/bin/syncthing serve --no-browser
- run_keybase

### gnome shell extensions

Ubuntu 24+

`apt-get install gnome-browser-connector gnome-shell-extension-prefs`

- https://extensions.gnome.org/extension/7065/tiling-shell/
- https://extensions.gnome.org/extension/5021/activate-window-by-title/

#### using activate-window-by-title

slack:

`gdbus call --session     --dest org.gnome.Shell     --object-path /de/lucaswerkmeister/ActivateWindowByTitle     --method de.lucaswerkmeister.ActivateWindowByTitle.activateBySubstring Slack`

## mainline kernel

Sometimes you need a more recent kernel for driver support
https://ubuntuhandbook.org/index.php/2020/08/mainline-install-latest-kernel-ubuntu-linux-mint/


## disable ip6 in grub

https://www.techrepublic.com/article/how-to-disable-ipv6-through-grub-in-linux/

`vim  /etc/default/grub`

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet ipv6.disable=1  splash"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

`sudo update-grub`


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
        },
        {
            "name": "Python debugpy",
            "type": "debugpy",
            "request": "attach",
            "connect": {
                "host": "localhost",
                "port": 5678
            }
        }

        ...
```
