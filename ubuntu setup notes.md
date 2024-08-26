# Basics / common tools

```
apt install tilix ack borgbackup python3-pyfuse3 fuse3 vlc vlc-plugin-samba ack vim direnv python3-pip gnome-tweaks git make curl linux-tools-generic htop ncdu xsane xfsprogs vmtouch
apt install gimp krita inkscape zim meld evolution nemo gnome-firmware solaar cheese
# bye bye gnu nano
apt remove nano firefox libreoffice
snap install brave libreoffice firefox
snap install sublime-text --classic
```

# Other 3rd party apps
- syncthing https://apt.syncthing.net/
- keybase
- code - use github for settings sync
- signal
- virtualbox
- dbeaver
- zed
- gitlab cli https://github.com/profclems/glab/releases


# wireguard vpn client setup
ssh into pi5-bastion, grab conf using \
`make get_conf` jumi3 is client number 2

# exfat suport
```
add-apt-repository universe
apt install exfat-fuse
```

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false

# pip stuff
`pip3 install --user azure-cli botocore fuzzywuzzy  exif   deemix   sshuttle  requests  PyYAML  pytest  pyhcl pyaml`

# gnome stuff
- multitasking
  - fixed number of workspaces
  - workspaces on all displays
- ubuntu desktop -> dock

# keyboard stuff
- **sup + up to maximize windows** -> settings -> keyboard -> view and customize shortcuts -> windows -> maximize window
- **alt tab shows icons not mini windows:** settings -> keyboard -> view and customize shortcuts -> switch applications = alt-tab

# keyboard stuff in tweaks -> keyboard -> additional layout options
- capslock behavior ->  disable caps lock
- compatibility options -> numlock always enters digits as in macos

# auto start stuff
- /usr/bin/syncthing serve --no-browser
- run_keybase

# docker

# gnome shell extensions
`apt-get install chrome-gnome-shell gnome-shell-extension-prefs`

- https://extensions.gnome.org/extension/906/sound-output-device-chooser/
- https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/

# tiling assistant
- https://extensions.gnome.org/extension/3733/tiling-assistant/

col layouts:

```
3 col layout:
0--0--0.33--1
0.33--0--0.33--1
0.66--0--0.33--1
```


# LAPTOP / POWER SAVING NOTES for DELL

# disable default gnome power saving cuz it's garbage
```
systemctl stop power-profiles-daemon
systemctl disable power-profiles-daemon
systemctl mask power-profiles-daemon
```

# install laptop tools
`apt install laptop-mode-tools powertop tlp tlp-gui`

# games

tuxtype pingus hedgewars
