source /etc/profile.d/vte-2.91.sh

SSH_ENV="$HOME/.ssh/agent-environment"

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


# alias sshuttle-jumidev='sshuttle -H jumiserv1-jump 192.168.1.0/24'
# alias sshfs-Shared="sshfs jumiserv1-jump:/mnt/8TA/data/Shared ~/Shared -f -o cache=yes -o kernel_cache "
# alias sshfs-Media="sshfs jumiserv1-jump:/mnt/8TA/media ~/Media -f -o cache=yes -o kernel_cache "
# alias sshfs-Repos="sshfs jumiserv1-jump:/home/jumidev/repos ~/Repos_jumiserv1 -f -o cache=yes -o kernel_cache "
# alias sshfs-Julia="sshfs jumiserv1-jump:/mnt/8TA/data/Julia ~/Julia -f -o cache=yes -o kernel_cache"
# alias sshfs-Data="sshfs jumiserv1-jump:/mnt/8TA/data ~/Data -f -o cache=yes -o kernel_cache"
# alias sshfs-Photos="sshfs jumiserv1-jump:/mnt/8TB/sync_data/jumi/Photos/Photos ~/Photos -f -o cache=yes -o kernel_cache"
# alias sshfs-jumi2-Julia="sshfs jumi2:/home/julia ~/jumi2_Julia -f -o cache=yes -o kernel_cache"

# git
alias gitpull="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"
alias gadd="git add -p"
alias gpush="git push"
alias gpull="git pull"
alias gstat="git status"
alias gbr="git branch"
alias gresethard="git reset --hard"
function gcomm() { git commit --message "$1"; }
