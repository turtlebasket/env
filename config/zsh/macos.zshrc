export PATH=$HOME/.bin:$HOME/.scripts:/usr/local/bin:$HOME/go/bin:$HOME/.cargo/bin:/opt/homebrew/opt/llvm/bin:$PATH:$HOME/.yarn/bin:$HOME/.local/bin:/opt/homebrew/opt/libpq/bin:/Applications/Julia-1.7.app/Contents/Resources/julia/bin/:/Applications/love.app/Contents/MacOS/:~/.emacs.d/bin/:/opt/homebrew/opt/llvm/bin:$HOME/opt/android-sdk/cmdline-tools/latest/bin:$HOME/opt/android-sdk/cmdline-tools/latest/platform-tools:$HOME/.nimble/bin:/nix/var/nix/profiles/default/bin:$HOME/opt/android-sdk/platform-tools:~/.nix-profile/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/michael/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nix-zsh-completions)

source $ZSH/oh-my-zsh.sh
source ~/.secrets

# User configuration

export ANDROID_HOME=$HOME/opt/android-sdk
export ANDROID_SDK_ROOT=$HOME/opt/android-sdk

# export DOCKER_HOST=ssh://mlisano@rocktiplex.michaellisano.com
# export DOCKER_HOST=ssh://mlisano@172.222.128.221:2202
# export DOCKER_HOST="unix://$HOME/.colima/docker.sock"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ENV VARS 
export ENV=dev
export CHROME_PATH="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export ANDROID=""
export VCPKG_ROOT="$HOME/.vcpkg-install"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -I/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include -I/opt/homebrew/opt/openblas/include"
export PIPENV_VERBOSITY=-1
export DOCKER_BUILDKIT=1

# For Nim
# export CPATH=$CPATH:$LD_LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
# export LIBRARY_PATH=$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
# export LIBRARY_DIRS=$LIBRARY_DIRS:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
# export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/openssl/lib/

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias nvide=/Applications/Neovide.app/Contents/MacOS/neovide
alias python3=/opt/homebrew/bin/python3
alias py=ptpython
alias ls=lsd
alias vim=nvim
alias qr=qrencode
alias youtube-dl=yt-dlp
alias yt-flac='yt-dlp -x --audio-format flac'
alias yt-mp3='yt-dlp -x --audio-format mp3'
alias yt-720='yt-dlp -f "best[height=720]"'
alias http-server='python3 -m http.server'

# personal pandoc prefs
alias ppandoc='pandoc -V geometry:margin=0.65in'

# use ssh kitten, but only if using kitty terminal
if [[ $TERM == 'xterm_kitty' ]]; then
	alias ssh=kitty +kitten ssh
fi

mvTrash() {
	mv "$@" ~/.Trash/
}

alias del=mvTrash
alias trash=mvTrash
alias copy=pbcopy
alias rosetta="arch -x86_64"
alias notes="cd ~/Documents/Notes/ && nvim -c 'set wrap' && cd"
alias todo="cd ~/Documents/Notes/todo && nvim && cd"
alias vc="$EDITOR ~/.config/nvim/init.lua"
alias zc="$EDITOR ~/.zshrc"
alias sc="$EDITOR ~/.ssh/config"
alias cb=chatblade

# Starship
eval "$(starship init zsh)"

# opam configuration
[[ ! -r /Users/michael/.opam/opam-init/init.zsh ]] || source /Users/michael/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


autoload bashcompinit
bashcompinit

[ -f "/Users/michael/.ghcup/env" ] && source "/Users/michael/.ghcup/env" # ghcup-env

alias arc='cd ~/.opt/arc3.2/ && racket -f as.scm'
alias docker-image-clean="docker image rm $(docker image ls | grep '<none>' | awk '{print $3}' | tr '\n' ' ')"
alias docker-container-clean="docker container rm $(docker container ls -a | grep 'Exited (' | awk '{print $1}' | tr '\n' ' ')"
alias cowquote='quote=$(curl -m 0.5 -s https://api.quotable.io/random); cowsay "$(echo $quote | jq -M .content) --$(echo $quote | jq -rM .author)"'
alias oi='interpreter'

# remote hosts
alias st='ssh thonkpad'
alias sr='ssh rocktiplex'
alias sso='ssh supernova.ocf'
alias sto='ssh tsunami.ocf'
alias sho='ssh hurricane.ocf'
alias styo='ssh typhoon.ocf'

# completions
source ~/.kube-zsh-completion
source ~/.ignite-zsh-completion

# Codon compiler path (added by install script)
export PATH=$PATH:/Users/michael/.codon/bin

# quote lmao


# opam
[[ ! -r /Users/michael/.opam/opam-init/init.zsh ]] || source /Users/michael/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
