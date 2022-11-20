#!/bin/bash

# Types of applications to backup / restore
categories=(zsh vim tmux git powerline)
category=""

# Paths used in restoration process
dir_target=/home/sean
dir_backup=$(pwd)

# Confirm when restoration overwrites an existing dotfile
confirm_restore() {
    file="$1"
    path="$2"

    if [[ "$path/$file" ]]; then
        read -e -p "File $file already exists, do you want to overwrite it? [y|n] " overwrite
        if [[ "$overwrite" == "y" ]]; then
            echo "Overwriting $file"
            rm -rf "$path/$file"
        else
            echo "Halting"
            exit
        fi
    fi
}

# Perform a restoration
perform_restore() {
    echo "Performing restoration on $category dotfiles"
    
    if [[ "$1" == "zsh" || "$1" == "all" ]]; then
        confirm_restore ".zshrc" "$dir_target"
        cp "$dir_backup/.zshrc" "$dir_target"
        confirm_restore ".p10k.zsh" "$dir_target"
        cp "$dir_backup/.p10k.zsh" "$dir_target"
        echo "zsh dotfiles restored!"
    fi
    if [[ "$1" == "vim" || "$1" == "all" ]]; then
        confirm_restore ".vimrc" "$dir_target"
        cp "$dir_backup/.vimrc" "$dir_target"
        echo "vim dotfiles restored!"
    fi
    if [[ "$1" == "tmux" || "$1" == "all" ]]; then
        confirm_restore ".tmux.conf" "$dir_target"
        cp "$dir_backup/.tmux.conf" "$dir_target"
        echo "tmux dotfiles restored!"
    fi
    if [[ "$1" == "git" || "$1" == "all" ]]; then
        confirm_restore ".gitconfig" "$dir_target"
        cp "$dir_backup/.gitconfig" "$dir_target"
        echo "git dotfiles restored!"
    fi
    if [[ "$1" == "powerline" || "$1" == "all" ]]; then
        dir_target="/home/sean/.local/lib/python3.11/site-packages/powerline"
        dir_backup="./powerline"
        confirm_restore "config_files" "$dir_target"
        cp -r "$dir_backup/config_files" "$dir_target/config_files"
        echo "Powerline dotfiles restored!"
    fi
}

# Perform a backup
perform_backup() {
    echo "Performing backup on $category dotfiles"

    if [[ "$1" == "zsh" || "$1" == "all" ]]; then
        if [[ -f "$dir_target/.zshrc" && -f "$dir_target/.p10k.zsh" ]]; then
            cp "$dir_target/.zshrc" "$dir_backup"
            cp "$dir_target/.p10k.zsh" "$dir_backup"
            echo "Backup made of zsh dotfiles!"
        else
            echo "Backup failed: Could not find either .zshrc or .p10k.zsh!"
        fi
    fi
    if [[ "$1" == "vim" || "$1" == "all" ]]; then
        if [[ -f "$dir_target/.vimrc" ]]; then
            cp "$dir_target/.vimrc" "$dir_backup"
            echo "Backup made of vim dotfiles!"
        fi
    fi
    if [[ "$1" == "tmux" || "$1" == "all" ]]; then
        if [[ -f "$dir_target/.tmux.conf" ]]; then
            cp "$dir_target/.tmux.conf" "$dir_backup"
            echo "Backup made of tmux dotfiles!"
        fi
    fi
    if [[ "$1" == "git" || "$1" == "all" ]]; then
        if [[ -f "$dir_target/.gitconfig" ]]; then
            cp "$dir_target/.gitconfig" "$dir_backup"
            echo "Backup made of git dotfiles!"
        fi
    fi
    if [[ "$1" == "powerline" || "$1" == "all" ]]; then
        dir_target="/home/sean/.local/lib/python3.11/site-packages/powerline"
        dir_backup="./powerline"
        if [[ "$dir_target/config_files" ]]; then
            rm -rf "$dir_backup/config_files"
            cp -r "$dir_target/config_files" "$dir_backup"
            echo "Backup made of Powerline dotfiles!"
        fi
    fi
}

# Select which dotfile categories to backup, default is all
if [[ -z $2 ]]; then
    category="all"
else
    for entry in "${categories[@]}"; do
        if [[ "$2" == "$entry" ]]; then
            category="$2"
            break
        fi
    done
    if [[ -z "$category" ]]; then
        echo "$2 is not a valid category of dotfile"
        exit
    fi
fi    

# Parse parameters
case "$1" in
    "-b")
        perform_backup "$category";;
    "-r")
        perform_restore "$category";;
    *)
        echo "Please indicate if you are making a backup with '-b' or restoration with '-r'";;
esac
