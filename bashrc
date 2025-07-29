source /etc/profile.d/vte-2.91.sh

SSH_ENV="$HOME/.ssh/agent-environment"

function restart_agent {
    killall -9 ssh-agent
    start_agent
}

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi


eval "$(direnv hook bash)"
alias da='direnv allow'

# nice history formatting
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=100000
export HISTFILESIZE=100000

export PATH=$PATH:~/bin/renault:~/.local/bin:~/repos/krezreb/photo-management/bin

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# python
alias pep8_check='pep8   --first .'
alias pep8_autofix='autopep8 . --recursive --in-place --pep8-passes 2000'
# Usage: debug_wrap my.module [arg1 arg2 …]
#
function debugpy_wrap() {
  local port=5678

  # cleanup possible leftovers
  pid=$(netstat -ntlp | grep ${port} | awk '{print $7}' | cut -d"/" -f1)
  if [ ! -z $pid ]; then
      kill -9 $pid
  fi

  # start debugpy in the background
  python3 -m debugpy --listen "${port}" --wait-for-client -m "$@" &
  dbg_pid=$!
  echo "🔍 debugpy listening on port ${port} (PID ${dbg_pid})"
  sleep 0.5
  # get pid of instance that listens
  lpid=$(lsof -iTCP:${port} | grep python3 | tail -n 1 | awk '{print $2}')

  # wait until the client attaches
   printf "⏳ waiting for client to connect"
   until lsof -iTCP:"${port}" -sTCP:ESTABLISHED &>/dev/null; do
     printf "."
     sleep 0.5
   done
   echo " connected!"

   # now wait for dbg_pid to terminate
   printf "⏳ waiting for client to disconnect"

   while ps aux | grep ${dbg_pid} | grep -v grep &>/dev/null; do
       printf "."
       sleep 0.5
   done
echo " disconnected!"

  # kill debugpy
  echo "💥 killing debugpy (PID ${lpid})"
  kill -9 "${lpid}"
}

# Example:
#   debug_wrap your.module arg1 arg2


# alias sshuttle-jumidev='sshuttle -H jumiserv1-jump 192.168.1.0/24'
# alias sshfs-Shared="sshfs jumiserv1-jump:/mnt/8TA/data/Shared ~/Shared -f -o cache=yes -o kernel_cache "
# alias sshfs-Media="sshfs jumiserv1-jump:/mnt/8TA/media ~/Media -f -o cache=yes -o kernel_cache "
# alias sshfs-Repos="sshfs jumiserv1-jump:/home/jumidev/repos ~/Repos_jumiserv1 -f -o cache=yes -o kernel_cache "
# alias sshfs-Julia="sshfs jumiserv1-jump:/mnt/8TA/data/Julia ~/Julia -f -o cache=yes -o kernel_cache"
# alias sshfs-Data="sshfs jumiserv1-jump:/mnt/8TA/data ~/Data -f -o cache=yes -o kernel_cache"
# alias sshfs-Photos="sshfs jumiserv1-jump:/mnt/8TB/sync_data/jumi/Photos/Photos ~/Photos -f -o cache=yes -o kernel_cache"
# alias sshfs-jumi2-Julia="sshfs jumi2:/home/julia ~/jumi2_Julia -f -o cache=yes -o kernel_cache"

# git
alias gadd="git add -p"
alias gpush="git push"
alias gpull="git pull"
alias gpull_recursive="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
alias gstat="git status"
alias gbr="git branch"

# git submodule aliases
alias gsubm_update="git submodule update --recursive --remote"
alias gsubm_sync="git submodule sync"

alias gresethard="git reset --hard"
function gcomm() { git commit --message "$1"; }

# docker-compose
alias docker-compose="docker compose"
