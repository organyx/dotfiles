# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/aleksandrbeliun/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell" Old theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gh fzf heroku docker docker-compose terraform npm nvm thefuck kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export novo_root_dir=/Users/aleksandrbeliun/novoresume
# start the docker stach 'docker-compose up'
alias dcu="bash $novo_root_dir/novo_infrastructure/workflow/dc-up.sh"
# stop the docker stack 'docker-compose down'
alias dcd="bash $novo_root_dir/novo_infrastructure/workflow/dc-down.sh"
# restart the docker stack, 'docker-compose down' then 'docker-compose up'
alias dcr="bash $novo_root_dir/novo_infrastructure/workflow/dc-restart.sh"
# pause containers 'docker-compose pause'
alias dcp="bash $novo_root_dir/novo_infrastructure/workflow/dc-pause.sh"
# unpause containers 'docker-compose unpause'
alias dcup="bash $novo_root_dir/novo_infrastructure/workflow/dc-unpuase.sh"
# build local docker stack containers 'docker-compose build'
alias dcb="bash $novo_root_dir/novo_infrastructure/workflow/dc-build.sh"
# follow logs of the docker stack 'docker-compose logs -f'
alias dcl="bash $novo_root_dir/novo_infrastructure/workflow/dc-logs.sh"
# delete all local docker data and build again
alias dcrebuild="bash $novo_root_dir/novo_infrastructure/workflow/docker-clean-and-rebuild.sh"
# git pull on local repositories
alias npr="bash $novo_root_dir/novo_infrastructure/workflow/update_or_clone_all_git_repos.sh"
# git status on local repositories
alias ngs="bash $novo_root_dir/novo_infrastructure/workflow/print_git_status_all_repos.sh"
# print logs of all running docker containers
alias print_all_docker_logs="bash $novo_root_dir/novo_infrastructure/workflow/print_all_docker_logs.sh"

alias ssh_main="ssh dev@\$(terraform output ip_address_main_server | tr -d '\"') -i secrets/accesskey"
alias ssh_mysql="ssh dev@\$(terraform output ip_address_mysql_server | tr -d '\"') -i secrets/accesskey"
alias ssh_mongo="ssh dev@\$(terraform output ip_address_mongo_server | tr -d '\"') -i secrets/accesskey"
alias ssh_blog="ssh dev@\$(terraform output ip_address_blog_server | tr -d '\"') -i secrets/accesskey"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/aleksandrbeliun/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH
# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/aleksandrbeliun/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH
# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(~/.zshfn "${fpath[@]}")
autoload -Uz $fpath[1]/*(.:t)
function update_dev_branch {
    echo "--> Checking out $1 branch ..."
    git checkout $1
    echo "--> Getting the sha of the latest commit on branch $1 ..."
    commit_sha=$(git rev-parse $1)
    echo "--> Checking out branch $2 ..."
    git checkout $2
    echo "--> Hard Resetting branch $2 to commit with sha $commit_sha"
    git reset --hard $commit_sha
    echo "--> You should now force push: $ git push --force"
    unset commit_sha
}

function deb {
    local container_arg="$1"
    docker exec -it $container_arg bash
}

function des {
    local container_arg="$1"
    docker exec -it $container_arg sh
}

function dl {
    local container_arg="$1"
    docker logs $container_arg -f
}

function update_dev_branch_force {
    echo "--> Checking out $1 branch ..."
    git checkout $1
    echo "--> Getting the sha of the latest commit on branch $1 ..."
    commit_sha=$(git rev-parse $1)
    echo "--> Checking out branch $2 ..."
    git checkout $2
    echo "--> Hard Resetting branch $2 to commit with sha $commit_sha"
    git reset --hard $commit_sha
    echo "--> Force pushing to branch $2 ..."
    git push --force-with-lease
    echo "--> checking out $1 ..."
    git checkout $1
    unset commit_sha
}

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aleksandrbeliun/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/aleksandrbeliun/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/aleksandrbeliun/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/aleksandrbeliun/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/aleksandrbeliun/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
source $HOME/.zsh/aliases

export novo_root_dir=/Users/aleksandrbeliun/novo_Root_directory

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
