windows 11 pro

enable rdp

# disable s0 standby https://www.makeuseof.com/windows-disable-modern-standby/
reg add HKLM\System\CurrentControlSet\Control\Power /v PlatformAoAcOverride /t REG_DWORD /d 0
-> reboot

# in windows features
- disable CIFS 1.0 client

# https://www.helpwire.app/blog/remote-desktop-for-windows-10-home/


## install:

- chrome
- rustdesk
- libreoffice