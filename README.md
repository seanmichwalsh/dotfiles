# Sean's Dotfiles

Repository of the dotfiles I use on my own system, along with setup scripts to reduce headache on system re-installations

## Making and restoring backups
The `backup.sh` script can be used to make or restore a backup for a given category of dotfiles.\
The script takes the following arguments:
- Action: Required, type of action to perform (`-r` for a restoration or `-b` for a backup)
- Category: Optional, which category of dotfiles to backup. Default is all, supported categories are as follows:
  - zsh
  - vim
  - tmux
  - git
  - powerline

Valid use of the script looks like this:
```bash
backup.sh -b zsh
```
---

## Installations
Several configuration tools I use must be manually installed. These are listed below, along with installation instructions / links

### oh-my-zsh
Plugin manager for zsh, install [here](https://ohmyz.sh/#install).\
Clone the following plugins into `.oh-my-zsh/plugins`:
  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)

### powerlevel10k
zsh theme configuration tool, install [here](https://github.com/romkatv/powerlevel10k#oh-my-zsh=).\
Install and configure Meslo terminal fonts from [here](https://github.com/romkatv/powerlevel10k/blob/master/font.md).

### Powerline
Terminal + vim status bar, install [here](https://powerline.readthedocs.io/en/master/installation/linux.html).\
Note: Powerline configuration is sourced from `.tmux.conf`, not `.zshrc` in my setup

### CLI Tools
- [exa](https://the.exa.website/) - `ls` replacement
- [bat](https://github.com/sharkdp/bat) - `cat` replacement
- [delta](https://github.com/dandavison/delta) - Improved git diffs
- [ripgrep](https://blog.burntsushi.net/ripgrep/) - `grep` replacement
- [fd](https://github.com/sharkdp/fd) - `find` replacement
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder

