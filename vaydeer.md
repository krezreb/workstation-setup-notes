```
mkdir -p /opt/vaydeer
vim /opt/vaydeer/keypad-service.sh
```


```
#!/bin/bash

while true; do
  VENDOR=0483
  SUBDEVICE=005
  VIDPID=$(lsusb | grep $VENDOR | grep -i keypad | awk '{print $6}')
  path=$(udevadm info -q path -n /dev/hidraw* | grep ${VIDPID} | head -n3 | tail -n 1)

  cat /dev/hidraw${path: -1} > /dev/null || sleep 5

done
```

`vim /lib/systemd/system/vaydeer-keypad.service`

```
[Unit]
Description=Activate Vaydeer 9 key smart keypad

[Service]
WorkingDirectory=/dev
ExecStart=/opt/vaydeer/keypad-service.sh
TimeoutStartSec=0
Restart=on-failure
StartLimitIntervalSec=60
StartLimitBurst=3

[Install]
WantedBy=multi-user.target
```


```
chmod +x /opt/vaydeer/keypad-service.sh
systemctl daemon-reload
```
