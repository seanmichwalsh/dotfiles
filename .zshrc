# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Disable setting terminal title
DISABLE_AUTO_TITLE="true"

# OMZ update interval
# Notify me when it's time to update
zstyle ':omz:update' mode reminder

# ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set oh-my-zsh plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Source OMZ configuration
export ZSH="/home/sean/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Attach or start a TMUX session
if [ -z "$TMUX" ] && [ ${UID} != 0 ]
then
    tmux new-session -A -s tmux
fi

# Preferred editor for local and remote sessions
export EDITOR='vim'

# PATH directories for locally installed binaries
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin

# Shortcuts to installation directories
export FLATPAK_DIR="/var/lib/flatpak/app"
export RPM_DIR="/usr/share/applications"
export GNOME_EXTENSIONS_DIR="/home/sean/.local/share/gnome-shell/extensions"

# Custom aliases
alias update="sudo dnf upgrade -y && sudo dnf autoremove -y && flatpak update -y && flatpak remove --unused -y && rustup update && omz update"
alias python="python3"

# CLI tool aliases
alias ls="exa"
alias cat="bat"
alias grep="rg"
alias find="fd"

# Source p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

