# issue on thinkpad where microphone no longer works past suspend

# trying
https://www.reddit.com/r/Ubuntu/comments/1dhttkr/back_to_pulseaudio_2404/
-> this uninstalled ubuntu-desktop :(
-> reinstall ubuntu-desktop-minimum (no libreoffice)
-> reinstall tlp tlp-rdw to replace power-profiles-daemon

So now it's running pulse audio, fingers crossed
-> FAIL

# try 2

- Upgraded kernel to 6.10.8
- used `alsactl info` to discover that acp63 driver is used for the mic
- used `lsmod` to discover this corresonds to kernel driver `snd_sof_amd_acp63`
- excluded `snd_sof_amd_acp63` from power management in tlpui
fingers crossed
