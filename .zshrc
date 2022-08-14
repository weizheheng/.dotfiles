# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/marcusheng/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
GIT_COMPLETION_CHECKOUT_NO_GUESS=1

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	git-hubflow
)

source $ZSH/oh-my-zsh.sh

# git-roll aliases
alias sg="shipgit"
alias sgu="shipgit update"
alias sgf="shipgit feature"
alias sgr="shipgit release"
alias sgh="shipgit hotfix"

# Example aliases
alias vim="~/Personal/Software/neovim-release/7/nvim-osx64/bin/nvim"
alias zshrc="vim ~/.zshrc"
alias vimrc="cd ~/.config/nvim && vim init.vim"
alias gcom="git commit -m"
alias gcomwm="git commit -a --allow-empty-message -m ''"
alias yr="brew services restart yabai"
alias yrc="vim ~/.yabairc"
alias mux="tmuxinator"

# Work Postco 360
alias w1="mux s 360"
alias ss= "overmind start -f Procfile.dev"
alias ss1="cd ~/Workspace/project-tapir && overmind start -F ~/.overmind.tmux.conf Procfile.dev"
alias sc1="cd ~/Workspace/project-tapir && rails c"
alias w1s="cd ~/Workspace/project-tapir && heroku run rails c --remote staging"
alias w1p="cd ~/Workspace/project-tapir && heroku run rails c --remote production"
alias w1sa="cd ~/Workspace/project-tapir && heroku run rails c --remote sandbox"
alias debug1="overmind connect api"
alias be="bundle exec"
alias test="be rspec"
alias minitest="ruby -Itest"
alias ptd="mux s ptd"

# Ruby debug
alias drb="ruby -rpry"

# Personal Project
alias byt="mux s budgetyourtime"
alias fishing="mux s fishing"
alias blog="mux s blog"

# Work PostCo
alias w2="cd ~/Workspace/postco"
alias ss2="cd ~/Workspace/postco && npm run server"
alias nc="nanobox console postco-web-production web.main"

# Work PostCo Mobile Agent
alias w3="cd ~/Workspace/postco-mobile-agent"
alias ss3="cd ~/Workspace/postco-mobile-agent && npx react-native start"

export EDITOR="/Users/marcusheng/Personal/Software/neovim-release/7/nvim-osx64/bin/nvim"
export BUNDLE_EDITOR="/Users/marcusheng/Personal/Software/neovim-release/7/nvim-osx64/bin/nvim"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.asdf/installs/nodejs/14.15.4/.npm/lib/node_modules/vscode-langservers-extracted/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
source /Users/marcusheng/.asdf/asdf.sh
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/Users/marcusheng/plugins/lua-language-server/3rd/luamake/luamake
