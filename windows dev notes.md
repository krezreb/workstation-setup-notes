vscode

git (comes with ming64, ssh, bash, awk...)
https://gitforwindows.org/

wsl



msys2
https://www.msys2.org/
pacman -S python3 python3-venv git make gcc 

integrate into vscode
https://stackoverflow.com/questions/45836650/how-do-i-integrate-msys2-shell-into-visual-studio-code-on-window


cygwin
(install wget)

apt-cyg, cli equivalent to apt
https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg

integrate cygwin terminal into vscode
https://stackoverflow.com/questions/46061894/vs-code-cygwin-as-integrated-terminal

add this to settings.json

```
    "cygwin": {
      "path": "C:\\cygwin64\\bin\\bash.exe",
      "args": [
        "--login",
        "-i"
      ],
      "env": {
        "CHERE_INVOKING": "1"
      }
    }
```


chocolatey
https://chocolatey.org/install


choco install make

python:
type `python3` in terminal, which will open windows store

