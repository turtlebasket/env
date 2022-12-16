export PATH=$HOME/.bin:/usr/local/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH:$HOME/.yarn/bin:/opt/homebrew/opt/libpq/bin:/Applications/Julia-1.7.app/Contents/Resources/julia/bin/:/Applications/love.app/Contents/MacOS/:~/.emacs.d/bin/:/opt/homebrew/opt/llvm/bin

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# export ANDROID_SDK_ROOT=$HOME/Library/Android

export DOCKER_HOST=ssh://root@147.182.184.116

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
export CHROME_PATH="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export ANDROID_SDK_ROOT="/opt/homebrew/Caskroom/android-sdk/4333796/"
export VCPKG_ROOT="$HOME/.vcpkg-install"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PIPENV_VERBOSITY=-1

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
alias yt-dlp-flac='yt-dlp -x --audio-format flac'
alias yt-dlp-mp3='yt-dlp -x --audio-format mp3'
alias http-server='python3 -m http.server'

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

# Starship
eval "$(starship init zsh)"

# opam configuration
[[ ! -r /Users/michael/.opam/opam-init/init.zsh ]] || source /Users/michael/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


autoload bashcompinit
bashcompinit
source /Users/michael/.vcpkg-install/scripts/vcpkg_completion.zsh

